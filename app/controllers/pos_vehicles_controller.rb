class PosVehiclesController < ApplicationController
  before_action :set_pos_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /pos_vehicles
  # GET /pos_vehicles.json
  def index
    @pos_vehicles = PosVehicle.all
  end

  # GET /pos_vehicles/1
  # GET /pos_vehicles/1.json
  def show
  end

  # GET /pos_vehicles/new
  def new
    @pos_vehicle = PosVehicle.new
  end

  # GET /pos_vehicles/1/edit
  def edit
  end

  # POST /pos_vehicles
  # POST /pos_vehicles.json
  def create
    @pos_vehicle = PosVehicle.new(pos_vehicle_params)

    respond_to do |format|
      if @pos_vehicle.save
        format.html { redirect_to @pos_vehicle, notice: 'Pos vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @pos_vehicle }
      else
        format.html { render :new }
        format.json { render json: @pos_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pos_vehicles/1
  # PATCH/PUT /pos_vehicles/1.json
  def update
    respond_to do |format|
      if @pos_vehicle.update(pos_vehicle_params)
        format.html { redirect_to @pos_vehicle, notice: 'Pos vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @pos_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @pos_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos_vehicles/1
  # DELETE /pos_vehicles/1.json
  def destroy
    @pos_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to pos_vehicles_url, notice: 'Pos vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pos_vehicle
      @pos_vehicle = PosVehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pos_vehicle_params
      params.require(:pos_vehicle).permit(:name, :access_code, :url)
    end
end
