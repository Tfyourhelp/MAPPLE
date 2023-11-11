class CategoriesController < ApplicationController
  before_action :logged_in_shop, only: [:index, :edit, :update, :destroy]
  before_action :find_id, only: [:show, :edit, :update, :destroy, :filter_price]
  before_action :find_shop_id, only: [:new, :create]

  def index
    @categories = Category.all.page(params[:page]).per(8)
  end

  def show
    @products = @category.products.page(params[:page]).per(8)
    @filter = [false, false, false, false, false]
  end

  def filter_price
    @filter = [false, false, false, false, false]
    if (params[:under250] == "1") && (params[:between250and500] == "1") && (params[:between500and750] == "1") && (params[:between750and1000] == "1") && (params[:over1000] == "1")
      @products = @category.products.page(params[:page]).per(8)
    else
      filter_products_by_price_ranges
    end
    render 'show', status: :unprocessable_entity
  end

  def new
    @category = @shop.categories.new
  end

  def create
    @category = @shop.categories.new(category_params)
    if @category.save
      redirect_to categories_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      update_image_to_category
      flash[:success] = "Category updated"
      redirect_to categories_url
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if @category.products.empty?
      @category.destroy
      flash[:success] = "Category deleted"
    else
      flash[:danger] = "This category has product, you cant delete"
    end
    redirect_to categories_url
  end

  private

  def update_image_to_category
    @category.image.attach(params[:category][:image]) unless params[:category][:image].nil?
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end

  def find_id
    @category = Category.find_by(params[:id])
    return unless @category.nil?

    flash[:danger] = "Cant find category"
    redirect_to carts_path
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
    @products = @category.products.where(filters)
  end
end
