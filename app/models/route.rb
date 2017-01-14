class Route < ActiveRecord::Base
  belongs_to :user
  has_many :vending_machines
  has_many :runs
end
