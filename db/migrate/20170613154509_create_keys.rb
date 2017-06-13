class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.string :keyword, null: false
      t.integer :number, null: false
      t.timestamps
    end

    add_index :keys, [:keyword, :number], unique: true

  end
end
