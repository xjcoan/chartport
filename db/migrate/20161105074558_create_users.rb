class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :password_digest

      t.timestamps
    end
  end
end
