class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role, default: 'customer'

      t.timestamps null: false
    end
  end
end
