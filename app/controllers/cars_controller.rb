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
    car.out = params[:out]

    if car 
      fees = car.unpark
      
    else
      redirect_to root_path
    end

  end


  private 

  def allowed
    params.require(:car).permit(:plate_number, :car_size_id, :in, :entry_point_id)
  end

end
