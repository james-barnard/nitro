class RouteManController < ApplicationController
  DEFAULT_EXPIRES = 7
  before_action :authenticate_user!

  def calc
    @active_run = Run.active(current_user)
    @routes = Route.all
    if params[:routeman]
      @route_id = params[:routeman].fetch(:route_id, @routes.first.id)
      @expires  = params[:routeman].fetch(:expires, DEFAULT_EXPIRES)
    end

    if params[:commit] == "resume"
      refresh(@active_run.id)
    elsif params[:commit] == "calc"
      @machines = VendingMachine.expiring_on_route_in_days(@route_id.to_i, @expires.to_i)
      @local_products = @machines.collect {|m| m.local_products}.flatten
    end

    if params[:commit] == "start"
      @route_started = true
      route = Route.find @route_id
      run = route.runs.build(user_id: current_user.id, status: "active")
      if run.save
        flash[:success] = "Run Started"
        @local_products.each { |p| run.duds.create(product_load_id: p.id) }
        refresh(run.id)
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

  private

  def refresh(run_id)
    @run = Run.find(run_id)
    @route_started = true
    @machines = @run.product_loads.collect {|pl| pl.vending_machine}
    @local_products = @machines.collect {|m| m.local_products}.flatten
  end
end
