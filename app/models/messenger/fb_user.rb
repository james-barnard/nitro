module MessengerController
  class FbUser < ActiveRecord::Base
    has_many :parts
    CONVERSATION_TIMEOUT=360

    def ungreeted?
      (Time.now - parts.last.created_at) > CONVERSATION_TIMEOUT
    end
  end
end
