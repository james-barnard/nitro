class FbUser < ActiveRecord::Base
  has_many :purchases
  has_many :product_loads, through: :purchases
  has_many :parts
  CONVERSATION_TIMEOUT = 36
  LOCATION_TIMEOUT     = 900

  def ungreeted?
    (Time.now - parts.last.try(:created_at)) > CONVERSATION_TIMEOUT
  end

  def not_located?
    return false if loc_skipped == true
    last_location = parts.where(part_type: "location").last
    last_location.nil? || (Time.now - last_location.created_at) > LOCATION_TIMEOUT
  end
end
