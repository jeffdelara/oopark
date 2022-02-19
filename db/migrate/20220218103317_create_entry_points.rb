class CreateEntryPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_points do |t|
      t.string :name
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
