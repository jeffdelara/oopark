class History < ApplicationRecord
  belongs_to :car_size
  belongs_to :lot_size
end
