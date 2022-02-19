class Car < ApplicationRecord
  belongs_to :car_size
  belongs_to :parking_slot
  
  def park
  end

  def unpark
  end
end
