class ApplicationController < ActionController::Base
  include SessionsHelper
  def require_logged_in(type)
    return if logged_in?(type)

    store_location
    redirect_to login_url, notice: "Please log in", flash: { class: "danger" }
  end

  def logged_in_user
    require_logged_in("user")
  end

  def logged_in_shop
    if logged_in?("user")
      redirect_to root_url, notice: "You can't be here", flash: { class: "danger" }
    else
      require_logged_in("shop")
    end
  end

  def find_shop_id
    @shop = Shop.first
  end

  def find_all_info_orders
    @info_orders = logged_in?("user") ? current_person("user").info_orders : InfoOrder.all
    @info_orders = @info_orders.page(params[:page]).per(10)
  end
end
