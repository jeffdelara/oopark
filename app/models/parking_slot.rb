class ParkingSlot < ApplicationRecord
  belongs_to :lot_size

  def occupied? 
    !@vacant
  end

end
