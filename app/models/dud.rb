class Dud < ActiveRecord::Base
  belongs_to :run
  belongs_to :product_load
end
