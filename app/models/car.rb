class Car < ApplicationRecord
  belongs_to :car_size
  
  def park
  end

  def unpark
  end
end
