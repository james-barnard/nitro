class FbUser < ActiveRecord::Base
  has_many :parts
  CONVERSATION_TIMEOUT = 360
  LOCATION_TIMEOUT     = 900

  def ungreeted?
    (Time.now - parts.last.created_at) > CONVERSATION_TIMEOUT
  end

  def not_located?
    (Time.now - parts.where(part_type: "location").created_at) > LOCATION_TIMEOUT
  end
end
