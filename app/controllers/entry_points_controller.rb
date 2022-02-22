class EntryPointsController < ApplicationController
  before_action :set_entry_point, only: [:show, :edit, :update, :destroy]

  # GET /entry_points
  def index
    @entry_points = EntryPoint.all
  end

  # GET /entry_points/1
  def show
  end

  # GET /entry_points/new
  def new
    parking_complex = ParkingSlots::ParkingComplex.new(16, 12)
    parking_complex.generate(ParkingSlot.all + EntryPoint.all)
    @parking = parking_complex.grid
    @entry_point = EntryPoint.new
  end

  # GET /entry_points/1/edit
  def edit
  end

  # POST /entry_points
  def create
    @entry_point = EntryPoint.new(entry_point_params)

    if @entry_point.save
      redirect_to new_entry_point_path, notice: 'Entry point was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /entry_points/1
  def update
    if @entry_point.update(entry_point_params)
      redirect_to @entry_point, notice: 'Entry point was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /entry_points/1
  def destroy
    @entry_point.destroy
    redirect_to entry_points_url, notice: 'Entry point was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_point
      @entry_point = EntryPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_point_params
      params.require(:entry_point).permit(:name, :x, :y)
    end
end
