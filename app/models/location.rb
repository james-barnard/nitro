class Location < ActiveRecord::Base
  has_many :vending_machines

  def concise_address
    "#{name}: #{address_1} #{city}"
  end
end
