class Owner < ActiveRecord::Base
  belongs_to :location
  belongs_to :organization
end
