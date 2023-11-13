module Users
  class InfoOrdersController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:new, :create, :order_history_detail]
    before_action :find_shop, only: [:create]
    before_action :find_cart_id, only: [:new, :create]
    before_action :find_all_cart_items_of_cart, only: [:new, :create]
    before_action :find_info_order_id, only: [:order_history_detail]

    def new
      @info_order = InfoOrder.new
      @info_order.user = current_person("user")
      @total_bill = params[:total_bill]
    end

    def create
      @info_order = InfoOrder.new(info_order_params)
      @info_order.user = current_person("user")
      @info_order.total_bill = params[:total_bill]
      cart_item_ids = params[:cart_item_ids].split.map(&:to_i)
      if @info_order.save
        create_detail_orders(cart_item_ids)
        send_order_confirmation_email(current_person("user"))
        send_new_order_from_customer_email(@shop, current_person("user"))
        @cart.finish
        update_product_quantity
        redirect_to users_carts_path, notice: "Email order confirmation was sent"
      else
        @total_bill = params[:total_bill]
        render 'new', status: :unprocessable_entity
      end
    end

    def order_history_detail; end

    private

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      if @info_order
        redirect_to users_user_path(current_person("user")), alert: "This is not your info order" unless @info_order.user == current_person("user")
      else
        redirect_to users_user_path(current_person("user")), notice: "Info order not found"
      end
    end

    def find_cart_id
      @cart = Cart.find_by(id: params[:cart_id])
      redirect_to user_root_path, alert: "Cart not found" if @cart.nil?
    end

    def find_all_cart_items_of_cart
      @cart_items = CartItem.where(cart_id: @cart.id)
    end

    def info_order_params
      params.require(:info_order).permit(:name, :address, :phone, :total_bill)
    end

    def create_detail_orders(cart_item_ids)
      cart_item_ids.each do |cart_item_id|
        cart_item = CartItem.find(cart_item_id)
        detail_order = DetailOrder.new(product_name: cart_item.product.name, price: cart_item.product.price, quantity: cart_item.quantity, info_order_id: @info_order.id, product_id: cart_item.product_id)
        detail_order.image.attach(cart_item.product.images.first.blob) if cart_item.product.images.attached?
        detail_order.save
      end
    end

    def update_product_quantity
      @info_order.detail_orders.each do |detail_order|
        product = Product.find_by(name: detail_order.product_name, price: detail_order.price)
        product.update_attribute(:quantity, product.quantity - detail_order.quantity)
      end
    end

    def send_new_order_from_customer_email(shop, user)
      ShopMailer.order_from_customer(shop, user).deliver_now
    end

    def send_order_confirmation_email(user)
      UserMailer.order_confirmation(user).deliver_now
    end
  end
end
