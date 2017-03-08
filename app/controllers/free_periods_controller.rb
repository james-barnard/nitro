class FreePeriodsController < ApplicationController
  def index
    @free_periods = FreePeriod.all
  end

  def create
  end
end
