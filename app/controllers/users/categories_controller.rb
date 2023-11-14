module Users
  class CategoriesController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :find_category, only: [:show]

    def show
      @filters = params[:filters]
      @arrange = params[:arrange]
      @products = Product.where(category_id: @category.id)
      @products, @filters = Categories::Filter.call(params, @products, @filters)
    end

    private

    def find_category
      @category = Category.find_by(id: params[:id]) 
      redirect_to users_root_path, alert: "Cant find category" if @category.nil?
    end
  end
end
