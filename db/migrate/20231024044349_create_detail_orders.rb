class CreateDetailOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :detail_orders, id: false do |t|
      t.integer :id, primary_key: true
      t.string :product_name
      t.float :price
      t.integer :quantity

      t.belongs_to :info_order, type: :integer
      t.belongs_to :product, type: :integer

      t.timestamps
    end
  end
end
