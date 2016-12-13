class RouteManController < ApplicationController
  before_action :authenticate_user!

  def index
    @local_products = []
    @routes = Route.all
  end

  def calc
    @routes = Route.all
  end
end
