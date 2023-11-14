module Shops
  class CategoriesController < Shops::BaseController
    before_action :logged_in_shop
    before_action :user_not_allow_here
    before_action :find_category, only: [:show, :edit, :update, :destroy]
    before_action :find_shop, only: [:new, :create]

    def index
      @categories = Category.all.page(params[:page]).per(Category::PER_PAGE)
    end

    def show
      @products = Product.where(category_id: @category.id).page(params[:page]).per(Product::PER_PAGE)
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.shop = @shop
      if @category.save
        update_image_to_category
        redirect_to shops_categories_url
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        update_image_to_category
        redirect_to shops_categories_url, notice: "Category updated"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if Product.find_by(category_id: @category.id).nil?
        @category.destroy
        redirect_to shops_categories_url, notice: "Category deleted"
      else
        redirect_to shops_categories_url, alert: "This category has product, you cant delete"
      end
    end

    private

    def update_image_to_category
      @category.image.attach(params[:category][:image]) unless params[:category][:image].nil?
    end

    def category_params
      params.require(:category).permit(:name, :image)
    end

    def find_category
      @category = Category.find_by(id: params[:id])
      redirect_to shops_categories_path, alert: "Cant find category" if @category.nil?
    end
  end
end
