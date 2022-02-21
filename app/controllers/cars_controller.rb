class CarsController < ApplicationController

  def index 
  end

  def new 
  end

  def create 
    car = Car.new(allowed)
    slot = car.park

    if slot 
      slot.update(vacant: false)
      redirect_to root_path, notice: 'Car is successfully parked.'
    else
      redirect_to root_path, alert: 'There is something wrong parking your vehicle.'
    end
  end

  def destroy
    car = Car.find_by(plate_number: params[:plate_number])
    
    if car 
      car.out = params[:out]
      fees = car.unpark

      history = 
        History.create(
          plate_number: car.plate_number, 
          car_size_id: car.car_size_id, 
          time_in: car.in,
          time_out: params[:out],
          parking_slot_id: car.parking_slot_id, 
          lot_size_id: car.parking_slot.lot_size_id, 
          entry_point_id: car.entry_point_id, 
          hours_parked: fees[:hours], 
          flat_rate_charge: fees[:flat_rate], 
          continuous_rate_charge: fees[:continuous_rate], 
          lot_size_charge: fees[:lot_size_charge], 
          total_charge: fees[:total]
        )

      car.destroy
      redirect_to summary_path(history.id)
    else 
      redirect_to root_path
    end
  end


  private 

  def allowed
    params.require(:car).permit(:plate_number, :car_size_id, :in, :entry_point_id)
  end

end
