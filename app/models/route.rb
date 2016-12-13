class Route < ActiveRecord::Base
  belongs_to :user
  has_many :vending_machines
end
