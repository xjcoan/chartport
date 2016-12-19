class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.string :refills

      t.references :patient, index: true, foreign_key: true

      t.timestamps
    end
    add_index :medications, [:patient_id, :created_at]
  end
end
