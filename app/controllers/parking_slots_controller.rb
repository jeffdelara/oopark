class ParkingSlotsController < ApplicationController
  before_action :set_parking_slot, only: [:show, :edit, :update, :destroy]
  before_action :set_parking_map, only: [:index, :new, :edit]

  def index; end

  def show; end

  def new
    @parking_slot = ParkingSlot.new
  end

  def edit; end

  def create
    @parking_slot = ParkingSlot.new(parking_slot_params)

    if @parking_slot.save
      redirect_to new_parking_slot_path, notice: 'Parking slot was successfully created.'
    else
      render :new
    end
  end

  def update
    if @parking_slot.update(parking_slot_params)
      redirect_to root_path, notice: 'Parking slot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parking_slot.destroy
    redirect_to parking_slots_url, notice: 'Parking slot was successfully destroyed.'
  end

  private
    def set_parking_map 
      parking_complex = ParkingSlots::ParkingComplex.new(16, 12)
      parking_complex.generate(ParkingSlot.all + EntryPoint.all)
      @parking = parking_complex.grid
    end

    def set_parking_slot
      @parking_slot = ParkingSlot.find(params[:id])
    end

    def parking_slot_params
      params.require(:parking_slot).permit(:x, :y, :lot_size_id, :vacant)
    end
end
