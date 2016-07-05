class VendingMachine < ActiveRecord::Base
  belongs_to :location
  belongs_to :route
end
