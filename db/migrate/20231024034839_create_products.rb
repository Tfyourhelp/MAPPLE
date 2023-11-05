class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.integer :quantity
      
      t.belongs_to :category
      t.timestamps
    end
  end
end
