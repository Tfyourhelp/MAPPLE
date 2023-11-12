module Shops
  class SessionsController < Shops::BaseController
    before_action :request_login_page_while_logged_in, only: [:new]

    def new; end

    def create
      shop = Shop.first
      if shop && shop.authenticate(params[:session][:password])
        log_in(shop, "shop")
        params[:session][:remember_me] == '1' ? remember(shop, "shop") : forget(shop, "shop")
        redirect_to shops_root_url
      else
        flash.now[:danger] = 'Invalid email/password shop combination'
        render 'new', status: :unprocessable_entity
      end
    end

    def destroy
      log_out(params[:person_type]) if logged_in?(params[:person_type])
      redirect_to users_root_url
    end
  end
end
