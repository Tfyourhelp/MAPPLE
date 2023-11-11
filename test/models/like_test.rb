# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_likes_on_product_id              (product_id)
#  index_likes_on_user_id                 (user_id)
#  index_likes_on_user_id_and_product_id  (user_id,product_id) UNIQUE
#
require "test_helper"

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
