# == Schema Information
#
# Table name: subcategories
#
#  id          :bigint           not null, primary key
#  filter_name :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  shop_id     :bigint
#
# Indexes
#
#  index_subcategories_on_category_id  (category_id)
#  index_subcategories_on_shop_id      (shop_id)
#
require "test_helper"

class SubcategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
