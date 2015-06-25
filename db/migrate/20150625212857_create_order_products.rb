class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :quantity, null: false, default: 0
      t.belongs_to :order, index: true, foreign_key: true
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
