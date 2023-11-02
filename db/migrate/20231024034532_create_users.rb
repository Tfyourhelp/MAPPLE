class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name

      t.string :email
      t.index :email, unique: true
      t.string :password_digest

      t.string :phone
      t.string :address

      t.string :remember_digest

      t.string :activation_token
      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at 

      t.string :reset_digest
      t.datetime :reset_sent_at
      
      t.timestamps
    end
  end
end
