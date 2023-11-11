class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :shop, type: :integer

      t.timestamps
    end
  end
end
