class ShopMailer < ApplicationMailer
  def order_from_customer(shop, user)
    @shop = shop
    @user = user
    mail to: shop.email, subject: "New order from customer"
  end
end