class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.string :encrypted_name
      t.string :encrypted_name_iv
      t.string :encrypted_dosage
      t.string :encrypted_dosage_iv
      t.string :encrypted_refills
      t.string :encrypted_refills_iv

      t.references :patient, index: true, foreign_key: true

      t.timestamps
    end
    add_index :medications, [:patient_id, :created_at]
  end
end
