class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :info, :error, :warning

  def request_login_page_while_logged_in
    if logged_in?("user")
      redirect_to users_root_url
    elsif logged_in?("shop")
      redirect_to shops_root_url
    end
  end

  def find_shop
    @shop = Shop.first
  end

  def log_user
    logged_in?("user")
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
