class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :project_name, null: false
      t.datetime :creation_date, null: false
      t.datetime :expiry_date, null: false
      t.boolean :enabled, null: false
      t.float :project_cost, null: false
      t.string :project_url, null: false
      t.timestamps
    end

    add_index :projects, :project_name, unique: true
    add_index :projects, :project_cost

  end
end
