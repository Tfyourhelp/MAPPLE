class CartsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :set_cart, only: [:index, :create, :change_quantity, :input_quantity, :destroy]
  before_action :find_product_to_add_cart_item, only: [:create, :change_quantity, :input_quantity]
  before_action :find_cart_item, only: [:destroy]

  def index
    @cart_items = @cart.cart_items
    # để xóa những trường hợp product hết hàng
    delete_cart_item_when_out_of_stock
  end

  def create
    if @cart_item.nil? # thêm mới cart_item
      add_new_cart_item
    else # có cart_item của product đó trong cart rồi
      update_cart_item
    end
  end

  # +1 hoặc -1
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

  # nếu chưa có cart
  def add_new_cart_item
    @cart_item = @cart.cart_items.new(product_id: @product.id)
    @cart_item.quantity = params[:quantity] ? params[:quantity].to_i : 1
    @cart_item.save
  end

  def update_cart_item
    if params[:quantity].nil? # nhấn add_to_cart ở ngoài trang chủ
      @cart_item.update(quantity: (@cart_item.quantity + 1))
    else # điền vào text_field trong product/show
      if (@cart_item.quantity + params[:quantity].to_i) <= @product.quantity
        @cart_item.update(quantity: @cart_item.quantity + params[:quantity].to_i)
      elsif @cart_item.quantity + params[:quantity].to_i > @product.quantity
        redirect_to product_path(@product), notice: "Maximum quantity of this product is #{@product.quantity}", flash: { class: "danger" }
      end
    end
  end

  def delete_cart_item_when_out_of_stock
    @cart_items.each do |cart_item|
      if cart_item.product.nil? || cart_item.product.quantity.zero? || (cart_item.quantity - cart_item.product.quantity).positive?
        cart_item.destroy
        redirect_to carts_path
      end
    end
  end

  # tim ra cart cua nguoi dung hien tai neu chua co thi tao moi và save
  def set_cart
    @cart = current_person("user").carts.find_or_initialize_by(finished: false)
    @cart.save if @cart.new_record?
  end

  def find_cart_item
    @cart_item = CartItem.find_by(id: params[:id])
    redirect_to carts_path, notice: "Cant find cart item", flash: { class: "danger" } if @cart_item.nil?
  end

  def find_product_to_add_cart_item
    @product = Product.find_by(id: params[:product_id])
    redirect_to products_path, notice: "Cant find product", flash: { class: "danger" } unless @product
    @cart_item = @cart.cart_items.find_by(product_id: @product.id) # tim ra san pham da nhan Add to cart
    redirect_to root_path, notice: "Cant find cart item", flash: { class: "danger" } unless @cart_item
  end

  def plus_operation
    @cart_item.update(quantity: @cart_item.quantity + 1) if @cart_item.quantity < @product.quantity
  end

  def minus_operation
    @cart_item.update(quantity: @cart_item.quantity - 1) unless @cart_item.quantity == 1
  end
end
