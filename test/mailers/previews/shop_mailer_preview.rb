# Preview all emails at http://localhost:3000/rails/mailers/shop_mailer
class ShopMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shop_mailer/order_from_customer
  def order_from_customer
    ShopMailer.order_from_customer
  end

end
