# == Schema Information
#
# Table name: shops
#
#  id              :bigint           not null, primary key
#  address         :string
#  description     :string
#  email           :string
#  name            :string
#  password_digest :string
#  phone           :string
#  remember_digest :string
#  tax_code        :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_shops_on_email  (email) UNIQUE
#
class Shop < ApplicationRecord
  has_many :products
  has_many :categories
  has_secure_password

  def send_new_order_from_customer_email(user)
    ShopMailer.order_from_customer(self, user).deliver_now
  end
end
