module InfoOrders
  class AfterPayment < BaseService
    def initialize(cart_item_ids, current_user, shop, cart, info_order)
      @cart_item_ids = cart_item_ids
      @current_user = current_user
      @shop = shop
      @cart = cart
      @info_order = info_order
    end

    def call
      create_detail_orders(@cart_item_ids)
      send_order_confirmation_email(@current_user)
      send_new_order_from_customer_email(@shop, @current_user)
      @cart.finish
      update_product_quantity(@info_order)
    end

    private

    def create_detail_orders(cart_item_ids)
      cart_item_ids.each do |cart_item_id|
        cart_item = CartItem.find_by(id: cart_item_id)
        next if cart_item.nil?

        detail_order = DetailOrder.new(product_name: cart_item.product.name, price: cart_item.product.price, quantity: cart_item.quantity, info_order_id: @info_order.id, product_id: cart_item.product_id)
        detail_order.image.attach(cart_item.product.images.first.blob) if cart_item.product.images.attached?
        detail_order.save
      end
    end

    def send_new_order_from_customer_email(shop, user)
      ShopMailer.order_from_customer(shop, user).deliver_now
    end

    def send_order_confirmation_email(user)
      UserMailer.order_confirmation(user).deliver_now
    end

    def update_product_quantity(info_order)
      info_order.detail_orders.each do |detail_order|
        product = Product.find_by(name: detail_order.product_name, price: detail_order.price)
        next if product.nil?

        product.update_attribute(:quantity, product.quantity - detail_order.quantity)
      end
    end
  end
end
