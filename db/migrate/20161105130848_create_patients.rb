class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :encrypted_name
      t.string :encrypted_name_iv
      t.string :encrypted_date_of_birth
      t.string :encrypted_date_of_birth_iv
      t.string :encrypted_phone_number
      t.string :encrypted_phone_number_iv
      t.integer :primary_care_physician, :references => "user"

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :patients, [:user_id, :created_at]
  end
end
