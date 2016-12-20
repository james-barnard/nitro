class RouteManController < ApplicationController
  before_action :authenticate_user!

  def index
    @local_products = []
    @routes = Route.all
  end

  def calc
    @routes = Route.all
    @machines = VendingMachine.all
    respond_to do |format|
      format.html
      format.js
    end

  end
end
