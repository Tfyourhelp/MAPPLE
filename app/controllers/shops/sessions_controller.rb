module Shops
  class SessionsController < Shops::BaseController
    def new; end

    def create
      shop = Shop.first
      return unless shop && shop.authenticate(params[:session][:password])

      log_in(shop, "shop")
      params[:session][:remember_me] == '1' ? remember(shop, "shop") : forget(shop, "shop")
      redirect_to shops_root_url
    end

    def destroy
      log_out(params[:person_type]) if logged_in?(params[:person_type])
      redirect_to users_root_url
    end
  end
end
