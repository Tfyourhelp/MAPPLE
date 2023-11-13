module Shops
  class BaseController < ApplicationController
    def logged_in_shop
      return if logged_in?("shop")
 
      store_location
      redirect_to shops_login_url, notice: "Please log in", flash: { class: "danger" }
    end

    def user_not_allow_here
      not_found if logged_in?("user")
    end
  end
end
