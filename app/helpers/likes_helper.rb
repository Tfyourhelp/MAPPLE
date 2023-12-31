module LikesHelper
  def if_like_product?(user, product)
    Like.find_by(user_id: user.id, product_id: product.id).present?
  end

  def like_count(product)
    pluralize(Like.where(product_id: product.id).count, "like")
  end
end
