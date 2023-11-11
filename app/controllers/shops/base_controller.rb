module Shops
  class BaseController < ApplicationController
    def logged_in_shop
      if logged_in?("user")
        redirect_to root_url, notice: "You can't be here", flash: { class: "danger" }
      else
        require_logged_in("shop")
      end
    end
  end
end