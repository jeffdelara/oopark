class CarSize < ApplicationRecord
  has_many :cars 
  has_many :histories
end
