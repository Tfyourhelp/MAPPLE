# == Schema Information
#
# Table name: carts
#
#  id          :bigint           not null, primary key
#  finished    :boolean          default(FALSE)
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
