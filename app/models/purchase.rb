class Purchase < ActiveRecord::Base
  belongs_to :product_load
  belongs_to :fb_user
end
