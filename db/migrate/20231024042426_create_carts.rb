class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts, id: false do |t|
      t.integer :id, primary_key: true
      t.boolean :finished, default: false
      t.datetime :finished_at

      t.belongs_to :user, type: :integer

      t.timestamps
    end
  end
end
