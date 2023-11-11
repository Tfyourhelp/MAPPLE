class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_logged_in(type)
    return if logged_in?(type)

    store_location
    redirect_to login_url, notice: "Please log in", flash: { class: "danger" }
  end

  def find_all_info_orders
    @info_orders = logged_in?("user") ? current_person("user").info_orders : InfoOrder.all
    @info_orders = @info_orders.page(params[:page]).per(10)
  end

  def find_shop_id # sửa tên chỗ này lại
    @shop = Shop.first
  end
end
