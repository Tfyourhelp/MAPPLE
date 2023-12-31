module Users
  class SearchsController < Users::BaseController
    before_action :shop_not_allow_here

    def search
      @search_content = params[:search_content]
      if @search_content.blank?
        redirect_to users_root_path
      elsif @search_content
        @products = Product.where("name ILIKE '%#{@search_content}%'").page(params[:page]).per(Product::PER_PAGE)
      end
    end
  end
end
