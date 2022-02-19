class CreateCarSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :car_sizes do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
