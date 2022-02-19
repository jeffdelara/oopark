class Car < ApplicationRecord

  validates :in, presence: true

  belongs_to :car_size
  belongs_to :parking_slot
  

  def park
    entry_point = EntryPoint.find(self[:entry_point_id])
    parking_slot = self.find_parking_slot(entry_point)
    self[:parking_slot_id] = parking_slot.id
    
    return parking_slot if self.save 
    false
  end

  def unpark
  end


  private 

  def find_parking_slot(entry_point)
    parking_slots = ParkingSlot.where(vacant: true, lot_size_id: self[:car_size_id]..)

    park_distances = {}
    # Data structure: { distance: ParkingSlot object }
    parking_slots.each { |slot| park_distances[self.compute_distance(slot, entry_point)] = slot }

    self.get_shortest_distance(park_distances)
  end

  def get_shortest_distance(park_distances)
    park_distances.sort_by { |distance, slot| distance }.first.last
  end

  def compute_distance(slot, gate)
    x = (gate.x - slot.x).abs
    y = (gate.y - slot.y).abs
    Math.sqrt(x**2 + y**2)
  end

end
