module Categories
  class Filter < BaseService
    def initialize(params, products, filters )
      @products = products
      @params = params
      if filters.nil?
        @filters = [false, false, false, false, false] if filters.nil?
      else
        @filters = filters 
      end
    end

    def call
      filter_price
      arrange_by
      @products = @products.page(@params[:page]).per(Product::PER_PAGE)
      [@products, @filters]
    end

    private

    def filter_price
      if (@params[:under250] == "1") && (@params[:between250and500] == "1") && (@params[:between500and750] == "1") && (@params[:between750and1000] == "1") && (@params[:over1000] == "1")
        @filters = [true, true, true, true, true]
      else
        filter_products_by_price_ranges
      end
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
        next unless @params[param.to_sym] == "1"

        index = price_ranges.keys.index(param)
        filters << filter
        @filters[index] = true
      end
      filters = filters.join(" or ")
      @products = @products.where(filters)
    end

    def arrange_by
      case @params[:arrange]
      when "decrease_price"
        @products = @products.order(price: :desc)
      when "increase_price"
        @products = @products.order(price: :asc)
      when "decrease_like"
        @products = @products.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
      when "increase_like"
        @products = @products.left_joins(:likes).group(:id).order('COUNT(likes.id) ASC')
      end
    end
  end
end
