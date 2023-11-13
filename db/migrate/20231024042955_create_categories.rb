class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.belongs_to :shop, type: :integer

      t.timestamps
    end
  end
end
