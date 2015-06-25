class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, default: 'name'
      t.string :email, null: false, default: 'name'
      t.string :password_digest, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
