module ProductsHelper
  def top_products
    Product.left_joins(:likes).select('products.*, COUNT(likes.id) AS likes_count').group('products.id').order('likes_count DESC').limit(15)
  end
end
