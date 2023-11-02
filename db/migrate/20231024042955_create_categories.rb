class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :shop


      t.timestamps
    end
    
    create_table :categories_products, id: false do |t|
      t.belongs_to :product
      t.belongs_to :category
      t.timestamps
    end
    add_index :categories_products, %i[product_id category_id], unique: true 
  

  end
end
