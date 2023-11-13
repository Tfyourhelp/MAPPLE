# == Schema Information
#
# Table name: carts
#
#  id          :integer          not null, primary key
#  finished    :boolean          default(FALSE)
#  finished_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def finish
    update_columns(finished: true, finished_at: Time.zone.now)
  end
end
