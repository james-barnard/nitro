class ConsumerPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_consumer_purchase, only: [:show, :edit, :update, :destroy]

  # GET /consumer_purchases
  # GET /consumer_purchases.json
  def index
    @consumer_purchases = ConsumerPurchase.all
  end

  # GET /consumer_purchases/1
  # GET /consumer_purchases/1.json
  def show
  end

  # GET /consumer_purchases/new
  def new
    @consumer_purchase = ConsumerPurchase.new
  end

  # GET /consumer_purchases/1/edit
  def edit
  end

  # POST /consumer_purchases
  # POST /consumer_purchases.json
  def create
    @consumer_purchase = ConsumerPurchase.new(consumer_purchase_params)

    respond_to do |format|
      if @consumer_purchase.save
        format.html { redirect_to @consumer_purchase, notice: 'Consumer purchase was successfully created.' }
        format.json { render :show, status: :created, location: @consumer_purchase }
      else
        format.html { render :new }
        format.json { render json: @consumer_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumer_purchases/1
  # PATCH/PUT /consumer_purchases/1.json
  def update
    respond_to do |format|
      if @consumer_purchase.update(consumer_purchase_params)
        format.html { redirect_to @consumer_purchase, notice: 'Consumer purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumer_purchase }
      else
        format.html { render :edit }
        format.json { render json: @consumer_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumer_purchases/1
  # DELETE /consumer_purchases/1.json
  def destroy
    @consumer_purchase.destroy
    respond_to do |format|
      format.html { redirect_to consumer_purchases_url, notice: 'Consumer purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer_purchase
      @consumer_purchase = ConsumerPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumer_purchase_params
      params.require(:consumer_purchase).permit(:consumer_id, :pos_vehicle_id, :product_load_id)
    end
end
