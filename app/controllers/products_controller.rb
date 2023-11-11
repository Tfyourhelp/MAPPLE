class ProductsController < ApplicationController
  before_action :logged_in_shop, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :find_category, only: [:create]
  before_action :find_all_categories, only: [:index, :new, :edit]

  def index
    @products = Product
    @page = params[:page]
    @products = Products::Search.call(params, @products, @categories)
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = @category.products.new(product_params)
    update_images_to_product
    if @product.save
      redirect_to products_url(@product), notice: "Product created success", flash: { class: "success" }
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @page = params[:page]
  end

  def update
    store_location
    if @product.update(product_params)
      update_images_to_product
      redirect_to products_url(@product, page: params[:page]), notice: "Product updated", flash: { class: "success" }
    else
      @categories = Category.all
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @product.detail_orders.empty?
      @product.destroy
      redirect_to products_url, notice: "Product deleted", flash: { class: "success" }
    else
      redirect_to products_url, notice: "Product is ordered, you cant delete", flash: { class: "danger" }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :images)
  end

  def find_id
    @product = Product.find(params[:id])
  end

  def update_images_to_product
    unless params[:product][:images].length == 1
      @product.images.delete_all unless @product.images.empty?
      @product.images.attach(params[:product][:images])
    end
  end

  def find_all_categories
    @categories = Category.all
  end

  def find_category
    @category = Category.find(params[:product][:category_id])
  end
end
