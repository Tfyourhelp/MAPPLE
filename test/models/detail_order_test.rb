# == Schema Information
#
# Table name: detail_orders
#
#  id            :bigint           not null, primary key
#  price         :float
#  product_name  :string
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  info_order_id :bigint
#
# Indexes
#
#  index_detail_orders_on_info_order_id  (info_order_id)
#
require "test_helper"

class DetailOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
