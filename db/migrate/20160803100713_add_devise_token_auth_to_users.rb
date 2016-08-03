class AddDeviseTokenAuthToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Tokens
      t.text :tokens

    end

    add_index :users, [:uid, :provider],     :unique => true
  end
end
