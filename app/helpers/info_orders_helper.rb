module InfoOrdersHelper
  def calculate_total_bill_in_order_detail
    total_bill = 0
    @info_order.detail_orders.each do |detail_order|
      total_bill+= detail_order.price*detail_order.quantity
    end
    return total_bill
  end

  def info_order_products_count(info_order)
    pluralize((info_order.detail_orders.length-1) , "product")
  end
end
