module Users
  class InfoOrdersController < ApplicationController
    before_action :find_shop_id, only: [:create]
    before_action :find_cart_id, only: [:new, :create]
    before_action :find_all_info_orders, only: [:create]
    before_action :find_all_cart_items_of_cart, only: [:new, :create]
    before_action :find_info_order_id, only: [:order_history_detail]
    #before_action :logged_in_shop, only: [:order_history_list_shop]

    def new
      @info_order = InfoOrder.new
      @info_order.user = current_person("user")
      @total_bill = params[:total_bill]
    end

    def create
      @info_order = @info_orders.new(info_order_params)
      @info_order.total_bill = params[:total_bill]
      cart_item_ids = params[:cart_item_ids].split.map(&:to_i)
      if @info_order.save
        create_detail_orders(cart_item_ids)
        current_person("user").send_order_confirmation_email
        @shop.send_new_order_from_customer_email(current_person("user"))
        @cart.finish
        update_product_quantity
        redirect_to users_carts_path, notice: "Email order confirmation was sent", flash: { class: "info" }
      else
        @total_bill = params[:total_bill]
        render 'new', status: :unprocessable_entity
      end
    end

    def order_history_detail; end

    private

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      # kiểm tra xem có info_order kh để chống / trên browser
      if @info_order
        # nếu info order kh phải của người dùng đó hoặc k phải là shop
        redirect_to root_path, notice: "This is not your info order", flash: { class: "danger" } unless @info_order.user == current_person("user") || logged_in?("shop")
      else
        redirect_to root_path, notice: "Info order not found", flash: { class: "danger" }
      end
    end

    def find_cart_id
      @cart = Cart.find(params[:cart_id])
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
  end
end
