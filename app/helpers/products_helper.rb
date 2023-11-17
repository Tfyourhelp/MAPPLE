module ProductsHelper
  def top_products
    Product.joins(:likes).select('products.*, COUNT(likes.id) AS likes_count').group('products.id').having('COUNT(likes.id) >= 5').order('likes_count DESC').limit(15)
  end
end
