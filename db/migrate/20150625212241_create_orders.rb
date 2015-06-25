class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :complete, default: 'false'
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
