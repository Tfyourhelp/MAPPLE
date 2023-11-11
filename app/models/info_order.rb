# == Schema Information
#
# Table name: info_orders
#
#  id         :bigint           not null, primary key
#  address    :string
#  name       :string
#  phone      :string
#  total_bill :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_info_orders_on_user_id  (user_id)
#
class InfoOrder < ApplicationRecord
  has_many :detail_orders
  belongs_to :user

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{9,11}\z/, message: "must be between 9 and 11 digits" }
  validates :address, presence: true
end
