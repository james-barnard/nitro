class LocalProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :brewery
  belongs_to :region
end
