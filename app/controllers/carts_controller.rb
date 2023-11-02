class CartsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create ,:edit, :update, :destroy]
  before_action :set_cart, only: [:index, :create, :change_quantity, :input_quantity]
  before_action :find_product_to_add_cart_item, only: [:create, :change_quantity, :input_quantity]
  
  def index
    @cart_items = @cart.cart_items
# để xóa những trường hợp product hết hàng
    @cart_items.each do |cart_item| 
      if cart_item.product.nil? or cart_item.product.quantity == 0 or ((cart_item.quantity - cart_item.product.quantity) > 0)
        cart_item.destroy
        redirect_to carts_path
      end
    end
  end

  def create
    if @product.quantity == 0
      flash[:info] = "This product is currently out of stock."
    else
      if @cart_item.nil? #thêm mới cart_item
        @cart_item = @cart.cart_items.new(product_id: @product.id)  
        unless params[:cart_item].nil? # điền vào text_field trong product/show
          @cart_item.quantity =  params[:cart_item][:quantity].to_i
        else # nhấn add_to_cart ở ngoài trang chủ
          @cart_item.quantity =  1
        end
        @cart_item.save
      else # có cart_item của product đó trong cart rồi
        unless params[:cart_item].nil? # điền vào text_field trong product/show
          @cart_item.update(quantity: @cart_item.quantity + params[:cart_item][:quantity].to_i)
        else # nhấn add_to_cart ở ngoài trang chủ
          @cart_item.update(quantity: (@cart_item.quantity + 1))
        end
      end
      redirect_to carts_path
    end
  end

  # +1 hoặc -1 
  def change_quantity 
    params[:operation] == "plus" ? plus_operation : minus_operation
    redirect_to carts_path
  end

  def input_quantity
    if params[:quantity].to_i  < @product.quantity
      @cart_item.update(quantity: params[:quantity])
      redirect_to carts_path
    end
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to carts_url
  end

  private

# tim ra cart cua nguoi dung hien tai neu chua co thi tao moi
  def set_cart 
    @cart = current_person("user").carts.find_by(finished: false)
    if @cart.nil?
      @cart = current_person("user").carts.build
      @cart.save
      @cart = current_person("user").carts.find_by(finished: false)
    end
  end

  def find_product_to_add_cart_item
    @product = Product.find_by(id: params[:product_id])
    redirect_to products_path unless @product
    @cart_item = @cart.cart_items.find_by(product_id: @product.id) #tim ra san pham da nhan Add to cart
  end

  def plus_operation
    if @cart_item.quantity < @product.quantity
      @cart_item.update(quantity: @cart_item.quantity + 1)
    end
  end
  
  def minus_operation
    unless @cart_item.quantity == 1
      @cart_item.update(quantity: @cart_item.quantity - 1)
    end
  end
end
