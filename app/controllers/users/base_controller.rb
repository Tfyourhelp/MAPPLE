module Users
  class BaseController < ApplicationController
    def logged_in_user
      return if logged_in?("user")

      store_location
      redirect_to users_login_url, alert: "Please log in"
    end

    def shop_not_allow_here
      error_not_found if logged_in?("shop")
    end
  end
end
