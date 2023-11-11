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
require "test_helper"

class InfoOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
