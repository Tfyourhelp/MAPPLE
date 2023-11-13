class CreateInfoOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :info_orders, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.string :address
      t.float :total_bill
      t.string :phone

      t.belongs_to :user, type: :integer

      t.timestamps
    end
  end
end
