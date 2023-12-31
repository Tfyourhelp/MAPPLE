# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  price       :float
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
class Product < ApplicationRecord
  PER_PAGE = 8
  has_many :cart_items, dependent: :destroy
  has_many :detail_orders
  has_many :likes

  belongs_to :category

  has_many_attached :images

  validates :name, presence: true, uniqueness: { scope: :category_id, case_sensitive: false }
  validates :description, presence: true, length: { maximum: 10000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
