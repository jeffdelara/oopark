class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.string :plate_number, null: false 
      t.references :car_size, null: false, foreign_key: true
      t.datetime :time_in
      t.datetime :time_out
      t.integer :parking_slot_id
      t.integer :lot_size_id
      t.integer :entry_point_id
      t.float :hours_parked
      t.float :flat_rate_charge
      t.float :continuous_rate_charge
      t.float :lot_size_charge
      t.float :total_charge

      t.timestamps
    end
  end
end
