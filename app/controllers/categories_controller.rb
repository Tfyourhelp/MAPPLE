class CategoriesController < ApplicationController
  before_action :logged_in_shop, only: [:index,:edit, :update, :destroy]
  before_action :find_id, only: [:show, :edit, :update, :destroy, :filter_price]
  before_action :find_shop_id, only: [:new, :create]
  
  def index
    @categories = Category.all.page(params[:page]).per(8) 
  end

  def show
    @products = @category.products.page(params[:page]).per(8)
    @filter = [false,false,false,false,false]
  end

  def filter_price
    @filter = [false,false,false,false,false]
    if (params[:under_250] == "1") and (params[:between_250_and_500] == "1") and (params[:between_500_and_750] == "1") and (params[:between_750_and_1000] == "1") and (params[:over_1000] == "1")
      @products = @category.products.page(params[:page]).per(8)
    else
      filter = []
      if params[:under_250] == "1"
        filter << "price < 250"
        @filter[0] = true
      end
      if params[:between_250_and_500] == "1"
        filter << "price BETWEEN 250 AND 500" 
        @filter[1] = true
      end
      if params[:between_500_and_750] == "1"    
        filter << "price BETWEEN 500 AND 750" 
        @filter[2] = true
      end
      if params[:between_750_and_1000] == "1"
        filter << "price BETWEEN 750 AND 1000" 
        @filter[3] = true
      end
      if params[:over_1000] == "1"
        @filter[4] = true
        filter << "price > 1000" 
      end
      filter = filter.join(" or ") 
      @products = @category.products.where(filter)
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

  def edit
  end

  def update
    @category.image.attach(params[:category][:image])
    if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to categories_url
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    unless @category.products.empty?
      flash[:danger] = "This category has product, you cant delete"
      redirect_to categories_url
    else
      @category.destroy
      flash[:success] = "Category deleted"
      redirect_to categories_url
    end
  end

  private 

  def category_params
    params.require(:category).permit(:name, :image)
  end

  def find_id
    @category = Category.find(params[:id])
  end
end
