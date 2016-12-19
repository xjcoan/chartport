class RemoveMedicationFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :patients, :medication
  end
end
