class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :phone_number
      t.text :medical_history
      t.integer :primary_care_physician, :references => "user"

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_index :patients, [:user_id, :created_at]
  end
end
