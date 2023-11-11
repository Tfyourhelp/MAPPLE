# == Schema Information
#
# Table name: shops
#
#  id              :integer          not null, primary key
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
  attr_accessor :remember_token
  
  has_many :products
  has_many :categories

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: { maximum: 50 } 
  validates :phone, presence: true, format: { with: /\A\d{9,11}\z/, message: "must be between 9 and 11 digits" }
  validates :address, presence: true
  validates :description, presence: true
  validates :tax_code, presence: true, numericality: { only_integer: true }, length: { is: 10 }

  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true

  def send_new_order_from_customer_email(user)
    ShopMailer.order_from_customer(self, user).deliver_now
  end
end
