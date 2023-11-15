module Shops
  class ProductsController < Shops::BaseController
    before_action :logged_in_shop
    before_action :user_not_allow_here
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :find_category, only: [:create]
    before_action :find_list_categories, only: [:index, :new, :create, :edit]
    before_action :find_detail_order, only: [:destroy]

    def index
      @page = params[:page]
      @products = Products::Search.call(params, Product.all, @categories)
    end

    def show; end

    def new
      @product =  Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        update_images_to_product
        redirect_to shops_products_url(@product), notice: "Product created success"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @page = params[:page]
    end

    def update
      if @product.update(product_params)
        update_images_to_product
        redirect_to shops_products_url(page: params[:page]), notice: 'Product updated'
      else
        @categories = Category.all.order(created_at: :desc)
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @detail_order
        redirect_to shops_products_url(page: params[:page]), alert: "Product is ordered, you cant delete"
      else
        @product.destroy
        redirect_to shops_products_url(page: params[:page]), notice: "Product deleted"
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :category_id, :description)
    end

    def update_images_to_product
      return if params[:product][:images].length == 1

      @product.images.delete_all unless @product.images.empty?
      @product.images.attach(params[:product][:images])
    end

    def find_product
      @product = Product.find_by(id: params[:id])
      redirect_to shops_products_path, alert: "Product not found" if @product.nil?
    end

    def find_category
      @category = Category.find_by(id: params[:product][:category_id])
      redirect_to new_shops_product, alert: "Cant find category" if @category.nil?
    end

    def find_list_categories
      @categories = Category.all.order(created_at: :desc)
    end

    def find_detail_order
      @detail_order = DetailOrder.find_by(product_id: @product.id)
    end
  end
end
