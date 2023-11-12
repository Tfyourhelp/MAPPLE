module Shops
  class InfoOrdersController < Shops::BaseController
    before_action :find_all_info_orders, only: [:order_history_list_shop]
    before_action :find_info_order_id, only: [:order_history_detail]
    before_action :logged_in_shop
    before_action :user_not_allow_here

    def order_history_list_shop; end

    def order_history_detail; end

    private

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      return if @info_order

      # Nếu k có info_order
      redirect_to shops_order_history_list_shop_path, notice: "Info order not found", flash: { class: "danger" }
    end
  end
end
