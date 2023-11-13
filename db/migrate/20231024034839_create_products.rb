class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.float :price
      t.string :description
      t.integer :quantity

      t.belongs_to :category, type: :integer
      t.timestamps
    end
  end
end
