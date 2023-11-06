class ProductsController < ApplicationController
  before_action :logged_in_shop, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :find_category, only: [:create]
  before_action :find_all_categories, only: [:index, :new, :edit]

  def index
    @products = Product.all.page(params[:page]).per(8)
    @page = params[:page]
  end

  def show; end

  def search_in_product_page
    @page = params[:page]
    @search_content = params[:search_content]
    if @search_content.blank?
      @products = Product.all.all.page(params[:page]).per(8)
    elsif @search_content
      @products = Product.where("name ILIKE  '%#{@search_content}%'").page(params[:page]).per(8)
    end
    render 'index', status: :unprocessable_entity
  end

  def new
    @product = Product.new
  end

  def create
    @product = @category.products.new(product_params)
    update_images_to_product
    if @product.save
      redirect_to products_url(@product)
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
      flash[:success] = "Product updated"
      redirect_to products_url(@product, page: params[:page])
    else
      @categories = Category.all
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @product.detail_orders.empty?
      @product.destroy
      flash[:success] = "Product deleted"
    else
      flash[:danger] = "Product is ordered, you cant delete"
    end
    redirect_to products_url
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
