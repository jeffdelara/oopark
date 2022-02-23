class EntryPointsController < ApplicationController
  before_action :set_entry_point, only: [:show, :edit, :update, :destroy]
  before_action :set_parking_map

  def index
    @entry_points = EntryPoint.all
  end

  def show; end

  def new
    @entry_point = EntryPoint.new
  end

  def edit; end

  # POST /entry_points
  def create
    @entry_point = EntryPoint.new(entry_point_params)

    if @entry_point.save
      redirect_to new_entry_point_path, notice: 'Entry point was successfully created.'
    else
      render :new
    end
  end

  def update
    if @entry_point.update(entry_point_params)
      redirect_to root_path, notice: 'Entry point was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entry_point.destroy
    redirect_to root_path, notice: 'Entry point was successfully destroyed.'
  end

  private
    def set_entry_point
      @entry_point = EntryPoint.find(params[:id])
    end

    def set_parking_map
      parking_complex = ParkingSlots::ParkingComplex.new(16, 12)
      parking_complex.generate(ParkingSlot.all + EntryPoint.all)
      @parking = parking_complex.grid
    end

    # Only allow a list of trusted parameters through.
    def entry_point_params
      params.require(:entry_point).permit(:name, :x, :y)
    end
end
