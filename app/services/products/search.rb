module Products
  class Search < BaseService
    def initialize(params, products, categories)
      @categories = categories
      @products = products
      @params = params
    end

    def call
      search_name
      filter_price
      filter_quantity
      search_category
      @products = @products.page(@params[:page]).per(Product::PER_PAGE)
    end

    private

    def search_name
      return if @params[:search_content].blank?

      @products = @products.where("name ILIKE  '%#{@params[:search_content]}%'")
    end

    def filter_price
      return if @params[:from_price].blank? && @params[:to_price].blank?

      price_filter = from_to_price
      @products = @products.where(price_filter)
    end

    def filter_quantity
      return if @params[:from_quantity].blank? && @params[:to_quantity].blank?

      quantity_filter = from_to_quantity
      @products = @products.where(quantity_filter)
    end

    def search_category
      return if @params[:category_id].blank?

      @products = @products.where(category_id: @params[:category_id])
    end

    def from_to_price
      if @params[:from_price] && @params[:to_price].blank?
        "price > #{@params[:from_price]}"
      elsif @params[:from_price].blank? && @params[:to_price]
        "price < #{@params[:to_price]}"
      elsif @params[:from_price] && @params[:to_price]
        "price BETWEEN #{@params[:from_price]} AND #{@params[:to_price]}"
      end
    end

    def from_to_quantity
      if @params[:from_quantity] && @params[:to_quantity].blank?
        "quantity > #{@params[:from_quantity]}"
      elsif @params[:from_quantity].blank? && @params[:to_quantity]
        "quantity < #{@params[:to_quantity]}"
      elsif @params[:from_quantity] && @params[:to_quantity]
        "quantity BETWEEN #{@params[:from_quantity]} AND #{@params[:to_quantity]}"
      end
    end
  end
end