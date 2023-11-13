module Users
  class ProductsController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :find_product, only: [:show]
    before_action :find_list_categories, only: [:index]

    def index
      @products = Product.all
      @page = params[:page]
      @products = Products::Search.call(params, @products, @categories)
    end

    def show; end

    private

    def find_product
      @product = Product.find_by(id: params[:id])
      redirect_to user_products_path, alert: "Product not found" if @product.nil?
    end

    def find_list_categories
      @categories = Category.all.order(created_at: :desc)
    end
  end
end
