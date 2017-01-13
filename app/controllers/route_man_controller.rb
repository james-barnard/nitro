class RouteManController < ApplicationController
  DEFAULT_EXPIRES = 7
  before_action :authenticate_user!

  def index
    @local_products = []
    @routes = Route.all
  end

  def calc
    @routes = Route.all
    if params[:routeman]
      @route_id = params[:routeman].fetch(:route_id, @routes.first.id)
      @expires  = params[:routeman].fetch(:expires, DEFAULT_EXPIRES)
    end
    @machines = VendingMachine.expiring_on_route_in_days(@route_id.to_i, @expires.to_i)
    @local_products = @machines.collect {|m| m.local_products}.flatten
    respond_to do |format|
      format.html
      format.js
    end
  end

  def loaded_products
    @product_loads = VendingMachine.find(params[:vm_id]).product_loads.active
    respond_to do |format|
      format.html
      format.js
    end
  end

  def remove_product
    product_load = ProductLoad.find params[:pl]
    product_load.update(removed_at: Time.now)

    vending_machine = ProductLoad.find(params[:pl]).vending_machine
    @product_loads = vending_machine.product_loads.active
    respond_to do |format|
      format.html
      format.js
    end
  end
end
