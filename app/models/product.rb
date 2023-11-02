# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  price       :float
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  shop_id     :bigint
#
# Indexes
#
#  index_products_on_shop_id  (shop_id)
#
class Product < ApplicationRecord
  has_many :cart_items
  has_many :detail_orders
  has_and_belongs_to_many :categories
  belongs_to :shop

  has_many_attached :images

  validates :name, presence: true 
  validates :description, presence: true, length: { maximum: 10000}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
