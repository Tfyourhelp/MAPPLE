module Shops
  class ProductsController < Shops::BaseController
    before_action :logged_in_shop
    before_action :user_not_allow_here
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :find_category, only: [:create]
    before_action :find_list_categories, only: [:index, :new, :edit]

    def index
      @products = Product.all
      @page = params[:page]
      @products = Products::Search.call(params, @products, @categories)
    end

    def show; end

    def new
      @product =  Product.new
    end

    def create
      @product = Product.new(product_params)
      @product.category = @category
      if @product.save
        update_images_to_product
        redirect_to shops_products_url(@product), notice: "Product created success"
      else
        render 'new', status: :unprocessable_entity
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
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
      if DetailOrder.find_by(product_id: @product.id).nil?
        @product.destroy
        redirect_to shops_products_url(page: params[:page]), notice: "Product deleted"
      else
        redirect_to shops_products_url(page: params[:page]), alert: "Product is ordered, you cant delete"
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :quantity, :category_id, :description, :images)
    end

    def find_product
      @product = Product.find_by(id: params[:id])
      redirect_to shop_products_path, alert: "Product not found" if @product.nil?
    end

    def update_images_to_product
      return if params[:product][:images].length == 1

      @product.images.delete_all unless @product.images.empty?
      @product.images.attach(params[:product][:images])
    end

    def find_list_categories
      @categories = Category.all.order(created_at: :desc)
    end

    def find_category
      @category = Category.find_by(id: params[:product][:category_id])
      redirect_to new_shops_product, alert: "Cant find category" if @category.nil?
    end
  end
end
