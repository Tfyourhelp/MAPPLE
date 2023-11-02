class CreateInfoOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :info_orders do |t|
      t.string :name
      t.string :address
      t.float :total_bill
      t.string :phone

      t.belongs_to :user

      t.timestamps
    end
  end
end
