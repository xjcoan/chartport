class CreateDoctorlists < ActiveRecord::Migration[5.0]
  def change
    create_table :doctorlists do |t|
      t.references :hospital, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
    add_index :doctorlists, [:hospital_id, :created_at]
    add_index :doctorlists, [:user_id, :created_at]
  end
end
