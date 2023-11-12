module Categories
  class Filter < BaseService
    def initialize(params, products, category, filters )
      @products = products
      @category = category
      @params = params
      if filters.nil?
        @filters = [false, false, false, false, false] if filters.nil?
      else
        @filters = filters 
      end
    end

    def call
      filter_price
      @products = @products.page(@params[:page]).per(8)
      return @products, @filters
    end

    private

    def filter_price
      if (@params[:under250] == "1") && (@params[:between250and500] == "1") && (@params[:between500and750] == "1") && (@params[:between750and1000] == "1") && (@params[:over1000] == "1")
        @products = @category.products.page(@params[:page]).per(8)
      else
        filter_products_by_price_ranges
      end
    end

    def filter_products_by_price_ranges
      price_ranges = {
        under250: "price < 250",
        between250and500: "price BETWEEN 250 AND 500",
        between_500and750: "price BETWEEN 500 AND 750",
        between750and1000: "price BETWEEN 750 AND 1000",
        over1000: "price > 1000"
      }
      filters = []
      price_ranges.each do |param, filter|
        next unless @params[param.to_sym] == "1"

        index = price_ranges.keys.index(param) # index của param trong price_range
        filters << filter
        @filters[index] = true
      end
      filters = filters.join(" or ")
      @products = @category.products.where(filters)
    end
  end
end
