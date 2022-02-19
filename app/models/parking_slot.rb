class ParkingSlot < ApplicationRecord
  belongs_to :lot_size
  has_one :car 

  def occupied? 
    !@vacant
  end

end
