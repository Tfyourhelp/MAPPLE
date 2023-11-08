module ApplicationHelper
  def product_like(user, product_id)
    Like.find_by(user_id: user.id, product_id: product_id).present?
  end
end
