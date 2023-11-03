class ApplicationController < ActionController::Base
  include SessionsHelper
  def logged_in_user
    unless logged_in?("user") 
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end

  def logged_in_shop
    unless logged_in?("shop") 
      if logged_in?("user")
        dfdf
        flash[:danger] = "You cant be here"
        redirect_to root_url
      else
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
  end

  def find_shop_id
    @shop = Shop.first
  end
end
