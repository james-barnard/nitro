class VendingMachine < ActiveRecord::Base
  belongs_to :location
  belongs_to :route
  has_many :local_products, through: :product_loads
  has_many :product_loads

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
end
