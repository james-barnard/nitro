class LocalProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_local_product, only: [:show, :edit, :update, :destroy]

  # GET /local_products
  # GET /local_products.json
  def index
    @local_products = LocalProduct.all
  end

  # GET /local_products/1
  # GET /local_products/1.json
  def show
  end

  # GET /local_products/new
  def new
    @local_product = LocalProduct.new
  end

  # GET /local_products/1/edit
  def edit
  end

  # POST /local_products
  # POST /local_products.json
  def create
    @local_product = LocalProduct.new(local_product_params)

    respond_to do |format|
      if @local_product.save
        format.html { redirect_to @local_product, notice: 'Local product was successfully created.' }
        format.json { render :show, status: :created, location: @local_product }
      else
        format.html { render :new }
        format.json { render json: @local_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_products/1
  # PATCH/PUT /local_products/1.json
  def update
    respond_to do |format|
      if @local_product.update(local_product_params)
        format.html { redirect_to @local_product, notice: 'Local product was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_product }
      else
        format.html { render :edit }
        format.json { render json: @local_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_products/1
  # DELETE /local_products/1.json
  def destroy
    @local_product.destroy
    respond_to do |format|
      format.html { redirect_to local_products_url, notice: 'Local product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_product
      @local_product = LocalProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_product_params
      params.require(:local_product).permit(:product_id, :brewery_id, :region_id)
    end
end
