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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
