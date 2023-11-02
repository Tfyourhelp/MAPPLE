class ProductsController < ApplicationController
  before_action :logged_in_shop, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_id, only: [:show, :edit, :update, :destroy]
  before_action :find_shop_id, only: [:create]
  before_action :find_all_categories, only: [:index, :new, :edit]

  def index
    @products = Product.all.page(params[:page]).per(8) 
    @page = params[:page]
  end

  def show
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = @shop.products.new(product_params)
    update_images_to_product
    if @product.save   
      add_category_to_product(@product)
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
      add_category_to_product(@product)
      flash[:success] = "Product updated"
      redirect_to products_url(@product, page: params[:page])
    else
      @categories = Category.all
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end

  private


  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description ,:images)
  end

  def find_id
    @product = Product.find(params[:id])
  end

  def add_category_to_product(product)
# dòng này để trong create và update đều được vì create thì product.categories.empty? --> true    
    product.categories.delete_all if !product.categories.empty? 
    product.categories << Category.find(params[:product][:category_id].to_i) if !params[:product][:category_id].empty?
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
end
