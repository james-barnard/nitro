class FacebookMessengerConversationService
  include Facebook::Messenger
  include ConversationHelper
  include MenuHelper

  def initialize(sender_id)
    @sender_id = sender_id
    puts "*******************> fbMessengerConversationService:sender_id: #{sender_id}"
  end

  def thank_you
    speak(PHRASES[:thanks], nil)
  end
end
