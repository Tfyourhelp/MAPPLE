module InfoOrders
  class QueryInfoOrders < BaseService
    def initialize(user_logged_in, current_user, params)
      @user_logged_in = user_logged_in
      @current_user = current_user
      @params = params
    end

    def call
      return query_infor_orders_by_user if @user_logged_in

      query_infor_orders_by_admin
    end

    private

    def query_infor_orders_by_user
      @current_user.info_orders.page(@params[:page]).per(InfoOrder::PER_PAGE)
    end

    def query_infor_orders_by_admin
      InfoOrder.all.page(@params[:page]).per(InfoOrder::PER_PAGE)
    end
  end
end
