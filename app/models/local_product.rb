class LocalProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :brewery
  belongs_to :region

  def to_label
    "#{brewery.to_label}:#{product.to_label}"
  end
end
