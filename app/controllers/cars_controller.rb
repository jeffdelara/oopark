class CarsController < ApplicationController

  def index 
    @cars = Car.all
  end

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

  def edit 
    @car = Car.find(params[:id])
  end

  def update 
    @car = Car.find(params[:id])
    
    if @car.update(allowed)
      redirect_to cars_path, notice: 'Success update.'
    else 
      render 'edit'
    end
  end

  def destroy
    car = Car.find_by(plate_number: params[:plate_number].upcase)
    
    if car 
      car.out = params[:out]
      fees = car.unpark

      redirect_to root_path, 
        notice: "Are you a time traveler? You got in: #{helpers.human_date(car.in)} 
                 but wants to unpark on #{helpers.human_date(car.out)}" and return unless fees 

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
