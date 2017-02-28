class Location < ActiveRecord::Base
  has_many :vending_machines

  geocoded_by :full_address, :latitude  => :lat, :longitude => :long
  after_validation :geocode, :if => :address_1_changed?

  def full_address
    [address_1, city, state, postal_code].compact.join(', ')
  end

  def concise_address
    "#{name}: #{address_1} #{city}"
  end
end
