class ApplicationController < ActionController::Base
  include SessionsHelper

  def request_login_page_while_logged_in
    if logged_in?("user")
      redirect_to users_root_url
    elsif logged_in?("shop")
      redirect_to shops_root_url
    end
  end

  def find_all_info_orders
    @info_orders = logged_in?("user") ? current_person("user").info_orders : InfoOrder.all
    @info_orders = @info_orders.page(params[:page]).per(10)
  end

  def find_shop # sửa tên chỗ này lại
    @shop = Shop.first
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
