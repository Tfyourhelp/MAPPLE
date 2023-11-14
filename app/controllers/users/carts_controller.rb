module Users
  class CartsController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:index, :create, :change_quantity, :input_quantity, :destroy]
    before_action :set_cart, only: [:index, :create, :change_quantity, :input_quantity, :destroy]
    before_action :find_product_to_add_cart_item, only: [:create, :change_quantity, :input_quantity]
    before_action :find_cart_item, only: [:destroy]

    def index
      @cart_items = @cart.cart_items
      delete_cart_item_when_out_of_stock(@cart_items)
    end

    def create
      return add_new_cart_item if @cart_item.nil?

      update_cart_item
    end

    def change_quantity
      Carts::ChangeQuantity.call(params, @cart_item, @product)
    end

    def destroy
      @cart_item.destroy
    end

    private

    def add_new_cart_item
      quantity = params[:quantity] ? params[:quantity].to_i : 1
      @cart_item = CartItem.new(product: @product, cart: @cart, quantity:)
      @cart_item.save
    end

    def update_cart_item
      new_quantity = params[:quantity]&.to_i || @cart_item.quantity + 1
      @cart_item.update(quantity: new_quantity)
    end

    def set_cart
      @cart = Cart.find_or_initialize_by(finished: false, user_id: current_person("user").id)
      @cart.save if @cart.new_record?
    end

    def find_product_to_add_cart_item
      @product = Product.find_by(id: params[:product_id])
      redirect_to users_root_path, alert: "Cant find product" if @product.nil?
      @cart_item = CartItem.find_by(product_id: @product.id, cart_id: @cart.id)
      # chỗ này hỏi a Sơn coi có nên redirect k
    end

    def find_cart_item
      @cart_item = CartItem.find_by(id: params[:id])
      redirect_to users_carts_path, alert: "Cant find cart item" if @cart_item.nil?
    end

    def delete_cart_item_when_out_of_stock(cart_items)
      cart_items.each do |cart_item|
        if cart_item.product.nil? || cart_item.product.quantity.zero? || (cart_item.quantity - cart_item.product.quantity).positive?
          cart_item.destroy
          redirect_to users_carts_path
        end
      end
    end
  end
end
