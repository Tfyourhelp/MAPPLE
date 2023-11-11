class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, type: :integer
      t.belongs_to :product, type: :integer

      t.timestamps
    end
    add_index :likes, %i[user_id product_id], unique: true
  end
end
