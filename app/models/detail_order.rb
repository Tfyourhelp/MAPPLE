# == Schema Information
#
# Table name: detail_orders
#
#  id            :integer          not null, primary key
#  price         :float
#  product_name  :string
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info_order_id :integer
#  product_id    :integer
#
# Indexes
#
#  index_detail_orders_on_info_order_id  (info_order_id)
#  index_detail_orders_on_product_id     (product_id)
#
class DetailOrder < ApplicationRecord
  has_one_attached :image

  validates :product_name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  belongs_to :info_order
end
