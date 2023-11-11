module CategoriesHelper
  def products_in_category_count(category)
    pluralize(category.products.count, "product")
  end

  def product_description(product)
    description = product.description.split[0..17].join(' ')
    description += '...' if product.description.length > 50
  end
end
