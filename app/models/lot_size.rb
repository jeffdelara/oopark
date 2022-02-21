class LotSize < ApplicationRecord  
  has_many :parking_slots
  has_many :histories
end
