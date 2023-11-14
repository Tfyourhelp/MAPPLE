module Shops
  class InfoOrdersController < Shops::BaseController
    before_action :find_info_order_id, only: [:order_history_detail]
    before_action :logged_in_shop
    before_action :user_not_allow_here

    def order_history_list_shop
      @info_orders = InfoOrders::QueryInfoOrders.call(log_user, current_person("user"), params)
    end

    def order_history_detail; end

    private

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      redirect_to shops_order_history_list_shop_path, alert: "Info order not found" if @info_order.nil?
    end
  end
end
