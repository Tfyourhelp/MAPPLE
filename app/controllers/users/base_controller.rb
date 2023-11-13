module Users
  class BaseController < ApplicationController
    def logged_in_user
      return if logged_in?("user")

      store_location
      redirect_to users_login_url, notice: "Please log in", flash: { class: "danger" }
    end

    def shop_not_allow_here
      not_found if logged_in?("shop")
    end
  end
end
