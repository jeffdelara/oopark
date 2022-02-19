class CreateLotSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :lot_sizes do |t|
      t.string :name
      t.string :code
      t.float :rate_per_hour

      t.timestamps
    end
  end
end
