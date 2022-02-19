class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :plate_number
      t.references :car_size, null: false, foreign_key: true
      t.datetime :in
      t.datetime :out
      t.integer :parking_slot_id
      t.integer :entry_point_id

      t.timestamps
    end
  end
end
