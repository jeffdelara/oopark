class CreateParkingSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_slots do |t|
      t.integer :x
      t.integer :y
      t.references :lot_size, null: false, foreign_key: true
      t.boolean :vacant, default: true

      t.timestamps
    end
  end
end
