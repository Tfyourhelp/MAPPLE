module Users
  class CategoriesController < Users::BaseController
    # before_action :logged_in_shop, only: [:index, :edit, :update, :destroy]
    before_action :find_category, only: [:show, :filter_price]

    def show
      @products = Product.where(category_id: @category.id).page(params[:page]).per(8)
      @filter = [false, false, false, false, false]
    end

    def filter_price
      @filter = [false, false, false, false, false]
      if (params[:under250] == "1") && (params[:between250and500] == "1") && (params[:between500and750] == "1") && (params[:between750and1000] == "1") && (params[:over1000] == "1")
        @products = Product.where(category_id: @category.id).page(params[:page]).per(8)
      else
        filter_products_by_price_ranges
      end
      render 'show', status: :unprocessable_entity
    end

    private

    def find_category
      @category = Category.find_by(id: params[:id])
      return unless @category.nil?

      redirect_to carts_path, notice: "Cant find category", flash: { class: "danger" }
    end

    def filter_products_by_price_ranges
      price_ranges = {
        under250: "price < 250",
        between250and500: "price BETWEEN 250 AND 500",
        between500and750: "price BETWEEN 500 AND 750",
        between750and1000: "price BETWEEN 750 AND 1000",
        over1000: "price > 1000"
      }
      filters = []
      price_ranges.each do |param, filter|
        next unless params[param.to_sym] == "1"

        index = price_ranges.keys.index(param) # index của param trong price_range
        filters << filter
        @filter[index] = true
      end
      filters = filters.join(" or ")
      @products = Product.where(category_id: @category.id).where(filters)
    end
  end
end
