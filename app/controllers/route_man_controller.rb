class RouteManController < ApplicationController
  before_action :authenticate_user!

  def index
    @local_products = []
    @routes = Route.all
  end

  def calc
    @routes = Route.all
    @machines = VendingMachine.expiring_on_route_in_days(params[:routeman][:route_id], params[:routeman][:expires].to_i)
    respond_to do |format|
      format.html
      format.js
    end

  end
end
