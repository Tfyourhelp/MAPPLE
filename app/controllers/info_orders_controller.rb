class InfoOrdersController < ApplicationController
  before_action :find_shop_id, only: [:create]
  before_action :find_cart_id, only: [:new,:create ]
  before_action :find_all_info_orders, only: [:create, :order_history_list_shop]
  before_action :find_info_order_id, only: [:order_history_detail]
  before_action :find_all_cart_items_of_cart, only: [:new, :create]

  def new
    @info_order = current_person("user").info_orders.build
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
      flash[:info] = "Email order confirmation was sent"
      redirect_to root_path
    else
      @total_bill = params[:total_bill]
      render 'new' , status: :unprocessable_entity
    end
  end

  def order_history_list_shop
  end

  def order_history_detail
  end

  private

  def find_info_order_id
    @info_order = InfoOrder.find(params[:info_order_id])
  end

  def find_cart_id
    @cart = Cart.find(params[:cart_id])
  end

  def find_all_cart_items_of_cart
    @cart_items = @cart.cart_items
  end

  def info_order_params
    params.require(:info_order).permit(:name, :address, :phone, :total_bill)
  end

  def create_detail_orders(cart_item_ids)
    (cart_item_ids).each do |cart_item_id|
      cart_item = CartItem.find(cart_item_id)
      detail_order = DetailOrder.new(product_name: cart_item.product.name, price: cart_item.product.price, quantity: cart_item.quantity, info_order_id: @info_order.id, product_id: cart_item.product_id)
      if cart_item.product.images.attached?
        detail_order.image.attach(cart_item.product.images.first.blob)
      end
      detail_order.save
    end
  end

  def update_product_quantity
    @info_order.detail_orders.each do |detail_order|
      product = Product.find_by(name: detail_order.product_name, price: detail_order.price)
      product.update_attribute(:quantity,product.quantity - detail_order.quantity)
    end
  end
end
