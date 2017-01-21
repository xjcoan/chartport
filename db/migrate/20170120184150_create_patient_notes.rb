class CreatePatientNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_notes do |t|
      t.text :note
      t.references :user, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true

      t.timestamps
    end
    add_index :patient_notes, [:user_id, :created_at]
    add_index :patient_notes, [:patient_id, :created_at]
  end
end
