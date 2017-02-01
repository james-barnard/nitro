class ProductLoadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_load, only: [:show, :edit, :update, :destroy]

  # GET /product_loads
  # GET /product_loads.json
  def index
    @product_loads = ProductLoad.order(:vending_machine_id).all
  end

  # GET /product_loads/1
  # GET /product_loads/1.json
  def show
  end

  # GET /product_loads/new
  def new
    @product_load = ProductLoad.new
  end

  # GET /product_loads/1/edit
  def edit
  end

  # POST /product_loads
  # POST /product_loads.json
  def create
    @product_load = ProductLoad.new(product_load_params)

    respond_to do |format|
      if @product_load.save
        format.html { redirect_to @product_load, notice: 'Product load was successfully created.' }
        format.json { render :show, status: :created, location: @product_load }
      else
        format.html { render :new }
        format.json { render json: @product_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_loads/1
  # PATCH/PUT /product_loads/1.json
  def update
    respond_to do |format|
      if @product_load.update(product_load_params)
        format.html { redirect_to @product_load, notice: 'Product load was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_load }
      else
        format.html { render :edit }
        format.json { render json: @product_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_loads/1
  # DELETE /product_loads/1.json
  def destroy
    @product_load.destroy
    respond_to do |format|
      format.html { redirect_to product_loads_url, notice: 'Product load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_load
      @product_load = ProductLoad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_load_params
      params.require(:product_load).permit(:local_product_id, :vending_machine_id, :total_pours, :date_loaded)
    end
end
