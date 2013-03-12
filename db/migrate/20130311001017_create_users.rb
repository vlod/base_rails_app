class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :signed_up
      t.datetime :last_sign_in_at
      t.timestamps
    end

    add_index :users, :email
  end
end
