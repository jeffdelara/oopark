module Cars

  class CarHistory 
    def initialize(car, fees)
      @car = car 
      @fees = fees
    end

    def create(time_out)
      History.create(
        plate_number: @car.plate_number, 
        car_size_id: @car.car_size_id, 
        time_in: @car.in,
        time_out: time_out,
        parking_slot_id: @car.parking_slot_id, 
        lot_size_id: @car.parking_slot.lot_size_id, 
        entry_point_id: @car.entry_point_id, 
        hours_parked: @fees[:hours], 
        flat_rate_charge: @fees[:flat_rate], 
        continuous_rate_charge: @fees[:continuous_rate], 
        lot_size_charge: @fees[:lot_size_charge], 
        total_charge: @fees[:total]
      ) 
    end

  end 

end
