module Users
  class BaseController < ApplicationController
    def logged_in_user
      if logged_in?("user")
        # logged in user thì k làm gì hết
      else
        store_location
        redirect_to users_login_url, notice: "Please log in", flash: { class: "danger" }
      end
    end

    def shop_not_allow_here
      not_found if logged_in?("shop")
    end
  end
end
