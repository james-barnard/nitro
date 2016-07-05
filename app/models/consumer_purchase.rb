class ConsumerPurchase < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :pos_vehicle
  belongs_to :product_load
end
