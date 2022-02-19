class ParkingSlotsController < ApplicationController
  before_action :set_parking_slot, only: [:show, :edit, :update, :destroy]

  # GET /parking_slots
  def index
    parking_complex = ParkingSlots::ParkingComplex.new(16, 12)
    parking_complex.generate(ParkingSlot.all + EntryPoint.all)
    # parking_complex.place_cars(Car.all)

    @parking = parking_complex.grid
  end

  # GET /parking_slots/1
  def show
  end

  # GET /parking_slots/new
  def new
    @parking_slot = ParkingSlot.new
  end

  # GET /parking_slots/1/edit
  def edit
  end

  # POST /parking_slots
  def create
    @parking_slot = ParkingSlot.new(parking_slot_params)

    if @parking_slot.save
      redirect_to @parking_slot, notice: 'Parking slot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parking_slots/1
  def update
    if @parking_slot.update(parking_slot_params)
      redirect_to @parking_slot, notice: 'Parking slot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parking_slots/1
  def destroy
    @parking_slot.destroy
    redirect_to parking_slots_url, notice: 'Parking slot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_slot
      @parking_slot = ParkingSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_slot_params
      params.require(:parking_slot).permit(:x, :y, :lot_size_id, :vacant)
    end
end
