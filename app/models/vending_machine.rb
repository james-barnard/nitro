class VendingMachine < ActiveRecord::Base
  belongs_to :location
  belongs_to :route
  has_many :local_products, through: :product_loads
  has_many :product_loads
  AMILLIONMILES = 999999

  scope :on_route, -> (route_id) { where(route_id: route_id.to_i) }

  def to_label
    "id:#{id}-#{model}"
  end

  def self.expiring_on_route_in_days(route_id, days)
    machines = on_route(route_id).all
    machines.to_a.keep_if do |m|
      m.product_loads.any? { |brew| brew.days_remaining <= days }
    end
  end

  def self.nearest_machine(lat, long)
    shortest_distance = AMILLIONMILES
    closest_machine = nil

    all.each do |machine|
      distance = machine.distance_away(lat, long)
      if distance < shortest_distance
        shortest_distance = distance
        closest_machine = machine
      end
    end
    closest_machine
  end

  def current_load
    product_loads.active
  end

  def display_address
    location.concise_address
  end

  def distance_away(lat, long)
    dx = location.lat.to_f - lat
    dy = location.long.to_f - long
    Math.sqrt(dx**2 + dy**2)
  end
end
