class VendingMachine < ActiveRecord::Base
  belongs_to :location
  belongs_to :route

  def to_label
    "id:#{id}-#{model}"
  end
end
