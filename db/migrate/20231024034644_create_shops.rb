class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name

      t.string :email
      t.index :email, unique: true
      t.string :password_digest

      t.string :phone
      t.string :address
      t.string :description
      t.bigint :tax_code
      t.string :remember_digest
      t.timestamps
    end
  end
end
