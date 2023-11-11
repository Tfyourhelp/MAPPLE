module Users
  class SearchsController < ApplicationController
    def search
      @search_content = params[:search_content]
      if @search_content.blank?
        redirect_to root_path
      elsif @search_content
        @products = Product.where("name ILIKE  '%#{@search_content}%'").page(params[:page]).per(8)
      end
    end
  end
end
