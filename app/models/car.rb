class Car < ApplicationRecord

  validates :in, :parking_slot_id, presence: true
  validates :plate_number, presence: true, uniqueness: true

  belongs_to :car_size
  belongs_to :parking_slot
  

  def park
    entry_point = EntryPoint.find(self[:entry_point_id])
    parking_slot = self.find_parking_slot_from(entry_point)

    # TODO: Check if previously parked (1 hr time window)

    return false if parking_slot.nil? 
    
    self[:parking_slot_id] = parking_slot.id
    
    return parking_slot if self.save 
    false
  end

  def unpark
    hours = self.get_total_hours_parked
    charges = self.get_charges(hours)
    
    # open up parking slot
    slot = ParkingSlot.find(self[:parking_slot_id])
    slot.update(vacant: true)

    charges
  end


  private 

  def get_charges(hours)
    
    charges = {
      hours: hours, 
      flat_rate: 40, 
      continous_rate: 0, 
      lot_size_charge: 0, 
      total: 40
    }
    
    # round up
    hours = hours.ceil

    return charges if hours <= 3
    
    charges[:continous_rate] = (hours / 24) * 5_000
    
    charges[:lot_size_charge] = 
      hours < 24 ? 
      self.compute_lot_size_charge(hours - 3) : 
      self.compute_lot_size_charge(hours % 24)

    charges[:total] += charges[:continous_rate] + charges[:lot_size_charge]

    charges 
  end

  def compute_lot_size_charge(hours)
    lot_size_rate = 
      ParkingSlot.find(self[:parking_slot_id]).
      lot_size.
      rate_per_hour

    lot_size_rate * hours
  end

  def get_total_hours_parked
    (self[:out].to_time - self[:in].to_time) / 3600
  end

  def find_parking_slot_from(entry_point)
    parking_slots = 
      ParkingSlot.where(
        vacant: true, 
        lot_size_id: self[:car_size_id]..
      )
    
    return nil if parking_slots.empty?

    park_distances = {}
    # Data structure: { distance: ParkingSlot object }
    parking_slots.each do |slot| 
      distance = self.compute_distance(slot, entry_point)
      park_distances[distance] = slot
    end

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
