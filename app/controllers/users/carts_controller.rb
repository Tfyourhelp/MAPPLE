module Users
  class CartsController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:index, :create, :change_quantity, :input_quantity, :destroy]
    before_action :set_cart, only: [:index, :create, :change_quantity, :input_quantity, :destroy]
    before_action :find_product_to_add_cart_item, only: [:create, :change_quantity, :input_quantity]
    before_action :find_cart_item, only: [:destroy]

    def index
      @cart_items = @cart.cart_items
      delete_cart_item_when_out_of_stock
    end

    def create
      if @cart_item.nil?
        add_new_cart_item
      else
        update_cart_item
      end
    end

    def change_quantity
      params[:operation] == "plus" ? plus_operation : minus_operation
    end

    def input_quantity
      @cart_item.update(quantity: params[:quantity]) if params[:quantity].to_i <= @product.quantity
    end

    def destroy
      @cart_item.destroy
    end

    private

    def add_new_cart_item
      @cart_item = CartItem.new(product_id: @product.id)
      @cart_item.cart = @cart
      @cart_item.quantity = params[:quantity] ? params[:quantity].to_i : 1
      @cart_item.save
    end

    def update_cart_item
      if params[:quantity].nil?
        @cart_item.update(quantity: (@cart_item.quantity + 1))
      else
        @cart_item.update(quantity: params[:quantity].to_i)
      end
    end

    def delete_cart_item_when_out_of_stock
      @cart_items.each do |cart_item|
        if cart_item.product.nil? || cart_item.product.quantity.zero? || (cart_item.quantity - cart_item.product.quantity).positive?
          cart_item.destroy
          redirect_to users_carts_path
        end
      end
    end

    def set_cart
      @cart = Cart.find_or_initialize_by(finished: false, user_id: current_person("user").id)
      @cart.save if @cart.new_record?
    end

    def find_cart_item
      @cart_item = CartItem.find_by(id: params[:id])
      redirect_to users_carts_path, alert: "Cant find cart item" if @cart_item.nil?
    end

    def find_product_to_add_cart_item
      @product = Product.find_by(id: params[:product_id])
      redirect_to users_root_path, alert: "Cant find product" if @product.nil?
      @cart_item = CartItem.find_by(product_id: @product.id, cart_id: @cart.id)
      redirect_to users_root_path, alert: "Cant find cart item in cart" if @cart_item.nil?
    end

    def plus_operation
      @cart_item.update(quantity: @cart_item.quantity + 1) if @cart_item.quantity < @product.quantity
    end

    def minus_operation
      @cart_item.update(quantity: @cart_item.quantity - 1) unless @cart_item.quantity == 1
    end
  end
end
