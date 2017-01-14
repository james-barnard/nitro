class RouteManController < ApplicationController
  DEFAULT_EXPIRES = 7
  before_action :authenticate_user!

  def refresh
    @run = Run.find params[:run_id]
    @route_started = true
    @machines = @run.product_loads.collect {|pl| pl.vending_machine}
    @local_products = @machines.collect {|m| m.local_products}.flatten
  end

  def calc
    @routes = Route.all
    if params[:routeman]
      @route_id = params[:routeman].fetch(:route_id, @routes.first.id)
      @expires  = params[:routeman].fetch(:expires, DEFAULT_EXPIRES)
    end
    @machines = VendingMachine.expiring_on_route_in_days(@route_id.to_i, @expires.to_i)
    @local_products = @machines.collect {|m| m.local_products}.flatten

    if params[:commit] == "start"
      @route_started = true
      route = Route.find @route_id
      run = route.runs.build(user_id: current_user, status: "active")
      if run.save
        flash[:success] = "Run Started"
        @local_products.each { |p| run.duds.create(product_load_id: p.id) }
        return redirect_to action: "refresh", run_id: run.id
      else
        flash[:error] = "Error: #{run.messages}"
      end

    end

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
