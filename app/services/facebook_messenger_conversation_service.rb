class FacebookMessengerConversationService
  include Facebook::Messenger
  include ConversationHelper
  include MenuHelper

  attr_reader :sender_id

  def initialize(sender_id)
    @sender_id = sender_id
    puts "*******************> fbMessengerConversationService:sender_id: #{sender_id}"
  end

  def thank_you
    speak(PHRASES[:thanks], nil)
  end

  def display_menu(message, fb_user)
    if fb_user.pos_machine_id.present?
      menu = menu_for_user(fb_user)
      message.reply(menu) unless menu.nil?
    end
  end

  def push_menu
    if fbuser.pos_machine_id.present?
      menu = menu_for_user(fbuser)
      deliver_message(menu) unless menu.nil?
    end
  end

  def deliver_message(message)
    Bot.deliver({
      recipient: {
        id: sender_id
      },
      message: message
    }, access_token: ENV['ACCESS_TOKEN'])
  end

  private
  def fbuser
    @fbuser ||= FbUser.find_by_sender_id(sender_id)
  end

  def menu_for_user(fb_user)
    machine = VendingMachine.find(fb_user.pos_machine_id)
    product_loads = machine.current_load
    mnu_elements = product_loads.map {|pl| mnu_element(pl.menu_name, pl, fb_user)}
    mnu_elements.empty? ? nil : product_menu(mnu_elements)
  end
end
