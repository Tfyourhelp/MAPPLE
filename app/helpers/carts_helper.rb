module CartsHelper
  def calculate_total_bill
    total_bill = 0
    @cart.cart_items.each do |cart_item|
      total_bill += cart_item.product.price * cart_item.quantity
    end
    return total_bill
  end

  def item_in_cart_of_user_length
    item_in_cart_length = current_person("user").carts.last.cart_items.length
  end
end
