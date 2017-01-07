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
    @machines = VendingMachine.expiring_on_route_in_days(@route_id, @expires)
    respond_to do |format|
      format.html
      format.js
    end

  end
end
