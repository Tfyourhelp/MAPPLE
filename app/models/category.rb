# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :integer
#
# Indexes
#
#  index_categories_on_shop_id  (shop_id)
#
class Category < ApplicationRecord
  has_many :products
  belongs_to :shop

  has_one_attached :image
  validates :name, presence: true
end
