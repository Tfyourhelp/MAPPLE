module Shops
  class SessionsController < Shops::BaseController
    before_action :not_allow_to_login_page_while_logged_in, only: [:new]
    before_action :find_shop, only: [:create]

    def new; end

    def create
      if @shop && @shop.authenticate(params[:session][:password])
        log_in_shop(@shop)
      else
        flash.now[:danger] = 'Invalid email/password shop combination'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      log_out(params[:person_type]) if logged_in?(params[:person_type])
      redirect_to users_root_url
    end

    private

    def log_in_shop(shop)
      log_in(shop, "shop")
      params[:session][:remember_me] == '1' ? remember(shop, "shop") : forget(shop, "shop")
      redirect_to shops_root_url
    end
  end
end
