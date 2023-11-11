# == Schema Information
#
# Table name: shops
#
#  id              :integer          not null, primary key
#  address         :string
#  description     :string
#  email           :string
#  name            :string
#  password_digest :string
#  phone           :string
#  remember_digest :string
#  tax_code        :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_shops_on_email  (email) UNIQUE
#
require "test_helper"

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
