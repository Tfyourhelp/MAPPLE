module Users
  class InfoOrdersController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:new, :create, :order_history_detail]
    before_action :find_shop, only: [:create]
    before_action :find_cart_of_current_user, only: [:new, :create]
    before_action :find_all_cart_items_of_cart, only: [:new, :create]
    before_action :find_info_order_id, only: [:order_history_detail]

    def new
      @info_order = InfoOrder.new
    end

    def create
      cart_item_ids = params[:cart_item_ids].split.map(&:to_i)
      price_quantity_pairs = params[:price_quantity_pairs].split.map(&:to_i).each_slice(2).to_a
      if InfoOrders::BeforePayment.call(cart_item_ids, price_quantity_pairs)
        redirect_to users_carts_path, alert: "There's might be something change, please check your cart again" 
      else
        @info_order = InfoOrder.new(info_order_params)
        @info_order.user = current_person("user")
        @info_order.total_bill = params[:total_bill]
        if @info_order.save
          InfoOrders::AfterPayment.call(cart_item_ids, current_person("user"), @shop, @cart, @info_order) 
          redirect_to users_carts_path, notice: "Email order confirmation was sent"
        else
          @total_bill = params[:total_bill]
          render :new, status: :unprocessable_entity
        end
      end
    end

    def order_history_detail; end

    private

    def info_order_params
      params.require(:info_order).permit(:name, :address, :phone)
    end

    def find_cart_of_current_user
      @cart = Cart.find_by(user_id: current_person("user").id, finished: false)
      redirect_to users_carts_path, alert: "Cart not found" if @cart.nil?
    end

    def find_all_cart_items_of_cart
      @cart_items = CartItem.where(cart_id: @cart.id)
      redirect_to users_carts_path, alert: "Cart item in cart not found" if @cart_items.empty?
    end

    def find_info_order_id
      @info_order = InfoOrder.find_by(id: params[:info_order_id])
      if @info_order
        redirect_to users_user_path(current_person("user")), alert: "This is not your info order" unless @info_order.user == current_person("user")
      else
        redirect_to users_user_path(current_person("user")), notice: "Info order not found"
      end
    end
  end
end
