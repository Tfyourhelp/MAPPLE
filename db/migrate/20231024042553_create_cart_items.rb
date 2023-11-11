class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items, id: false do |t|
      t.integer :id, primary_key: true
      t.integer :quantity

      t.belongs_to :cart, type: :integer
      t.belongs_to :product, type: :integer

      t.timestamps
    end
  end
end
