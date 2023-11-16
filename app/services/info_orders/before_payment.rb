module InfoOrders
  class BeforePayment < BaseService
    def initialize(cart_item_ids, price_quantity_pairs)
      @cart_item_ids = cart_item_ids
      @price_quantity_pairs = price_quantity_pairs
    end

    def call
      price_or_quantity_change_after_checkout(@cart_item_ids, @price_quantity_pairs)
    end

    private

    def price_or_quantity_change_after_checkout(cart_item_ids, price_quantity_pairs)
      check = false
      cart_item_ids.zip(price_quantity_pairs).each do |cart_item_id, price_quantity_pair|
        cart_item = CartItem.find_by(id: cart_item_id)
        if cart_item.nil?
          check = true
          next
        end

        product = cart_item.product
        if product.nil?
          check = true
          next
        end
        check = true if price_quantity_pair[0] != product.price
        check = true if price_quantity_pair[1] > product.quantity
      end
      check
    end
  end
end