class CreateHospitals < ActiveRecord::Migration[5.0]
  def change
    create_table :hospitals do |t|
      t.string :encrypted_name
      t.string :encrypted_name_iv
      t.string :encrypted_street_address
      t.string :encrypted_street_address_iv
      t.string :encrypted_city
      t.string :encrypted_city_iv
      t.string :encrypted_state
      t.string :encrypted_state_iv
      t.string :encrypted_zipcode
      t.string :encrypted_zipcode_iv
      t.timestamps
    end
  end
end
