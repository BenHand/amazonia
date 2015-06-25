class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false, default: 'title'
      t.string :description, null: false, default: 'description'
      t.integer :price, null: false, default: 3000
      t.integer :inventory, null: false, default: 10
      t.string :pic, null: false, default: 'picture url'

      t.timestamps null: false
    end
  end
end
