module ApplicationHelper
  def if_like_product?(user, product_id)
    Like.find_by(user_id: user.id, product_id: product_id).present?
  end
end
