class CarsController < ApplicationController

  def index; end

  def new; end

  def create 
    car = Car.new(allowed)
    car.plate_number = allowed[:plate_number].upcase

    slot = car.park

    if slot 
      slot.update(vacant: false)
      redirect_to root_path, notice: 'Car is successfully parked.'
    else
      redirect_to root_path, alert: 'There is something wrong parking your vehicle.'
    end
  end

  def destroy
    car = Car.find_by(plate_number: params[:plate_number].upcase)
    
    if car 
      car.out = params[:out]
      fees = car.unpark

      history = Cars::CarHistory.new(car, fees)
      car_history = history.create(car.out)

      car.destroy
      redirect_to summary_path(car_history.id)
    else 
      redirect_to root_path
    end
  end


  private 

  def allowed
    params.require(:car).permit(:plate_number, :car_size_id, :in, :entry_point_id)
  end

end
