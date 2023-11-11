module Users
  class ProductsController < Users::BaseController
    before_action :logged_in_user 
    before_action :find_product, only: [:show]
    before_action :find_all_categories, only: [:index]

    def index
      @products = Product.all
      @page = params[:page]
      @products = Products::Search.call(params, @products, @categories)
    end

    def show; end

    private

    def find_product
      @product = Product.find(params[:id])
    end

    def find_all_categories
      @categories = Category.all.order(created_at: :desc)
    end
  end
end
