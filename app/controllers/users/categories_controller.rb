module Users
  class CategoriesController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :find_category, only: [:show]

    def show
      @filters =  params[:filters]
      @products = Product.where(category_id: @category.id).page(params[:page]).per(8)
      @products, @filters = Categories::Filter.call(params, @products, @category, @filters)
    end

    private

    def find_category
      @category = Category.find_by(id: params[:id])
      return unless @category.nil?

      redirect_to users_root_path, notice: "Cant find category", flash: { class: "danger" }
    end
  end
end
