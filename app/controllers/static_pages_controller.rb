class StaticPagesController < ApplicationController
  def home
    if logged_in?("shop")
      redirect_to products_url
    else
      @categories = Category.all.order(id: :asc)
      @products = Product.all.page(params[:page]).per(8)
    end
  end
end
