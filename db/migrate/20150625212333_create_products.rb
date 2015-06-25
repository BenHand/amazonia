class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :inventory
      t.string :pic

      t.timestamps null: false
    end
  end
end
