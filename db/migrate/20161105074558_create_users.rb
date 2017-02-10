class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :encrypted_name
      t.string :encrypted_name_iv
      t.string :email
      t.boolean :admin
      t.string :password_digest

      t.timestamps
    end
  end
end
