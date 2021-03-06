class FbUser < ActiveRecord::Base
  has_many :purchases
  has_many :product_loads, through: :purchases
  has_many :parts
  CONVERSATION_TIMEOUT = 36
  LOCATION_TIMEOUT     = 900

  def ungreeted?
    return true if parts.empty?
    (Time.now - parts.last.created_at) > CONVERSATION_TIMEOUT
  end

  def repeat_customer?
    purchases.present? && pos_machine_id && customer_id && last4
  end

  def not_located?
    return false if loc_skipped == true
    last_location = parts.where(part_type: "location").last
    last_location.nil? || (Time.now - last_location.created_at) > LOCATION_TIMEOUT
  end
end
