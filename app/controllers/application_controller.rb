class ApplicationController < ActionController::Base
  include SessionsHelper
  def require_logged_in(type)
    unless logged_in?(type)
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
  
  def logged_in_user
    require_logged_in("user")
  end
  
  def logged_in_shop
    if logged_in?("user")
      flash[:danger] = "You can't be here"
      redirect_to root_url
    else
      require_logged_in("shop")
    end
  end 

  def find_shop_id
    @shop = Shop.first
  end
end