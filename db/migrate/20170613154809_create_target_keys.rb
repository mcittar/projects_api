class CreateTargetKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :target_keys do |t|
      t.integer :project_id, null: false
      t.integer :key_id, null: false
      t.timestamps
    end

    add_index :target_keys, [:project_id, :key_id], unique: true

  end
end
