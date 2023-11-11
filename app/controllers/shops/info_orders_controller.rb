module Shops
  class InfoOrdersController < Users::BaseController
    before_action :find_all_info_orders, only: [:order_history_list_shop]
    before_action :find_info_order_id, only: [:order_history_detail]
    #before_action :logged_in_shop, only: [:order_history_list_shop]

    def order_history_list_shop; end

    def order_history_detail; end

    private

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      # kiểm tra xem có info_order kh để chống / trên browser
      if @info_order
        # nếu info order kh phải của người dùng đó hoặc k phải là shop
        redirect_to root_path, notice: "This is not your info order", flash: { class: "danger" } unless @info_order.user == current_person("user") || logged_in?("shop")
      else
        redirect_to root_path, notice: "Info order not found", flash: { class: "danger" }
      end
    end
  end
end
