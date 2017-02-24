require 'facebook/messenger'

include Facebook::Messenger
include ConversationHelper
include MenuHelper

API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?address='.freeze
REVERSE_API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='.freeze

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

def listen
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only

    @sender_id = message.sender['id']
    fb_user = FbUser.find_or_create_by(sender_id: @sender_id)

    if message_contains_location?(message)
      connect_user_with_vending_machine(message, fb_user)
    elsif message.quick_reply && message.quick_reply == "just_chat"
      puts "skipping location"
      fb_user.update(loc_skipped: true)
      speak(PHRASES[:just_chat], nil)
    elsif message.quick_reply && message.quick_reply == "no_location"
      speak(PHRASES[:vm_no_machine], nil)
    elsif message.quick_reply && message.quick_reply == "location_confirmed"
      puts "location confirmed!"
      if fb_user.pos_machine_id.present?
        fb_user.update(pos_confirmed: true)
      end
      display_menu(message, fb_user)
    elsif fb_user.ungreeted?
      update_user_profile(fb_user)
      greet_user(fb_user, message.text)
      speak(PHRASES[:ask_location], TYPE_LOCATION)
      fb_user.update(loc_skipped: false)
    elsif fb_user.not_located?
      speak(PHRASES[:ask_location], TYPE_LOCATION)
    elsif
      case message.text
      when /hello/i
        greet_user(fb_user, message.text)
      when /menu/i
        display_menu(message, fb_user)
      else
        greet_user(fb_user, message.text)
        puts "huh?"
      end
    end

    create_part(message.messaging["message"], fb_user)
  end
end

def connect_user_with_vending_machine(message, fb_user)
  @lat, @long = locate_user(message)
  machine = VendingMachine.nearest_machine(@lat, @long)
  fb_user.update(pos_machine_id: machine.try(:id), pos_confirmed: false)

  if machine.present?
    speak("#{PHRASES[:vm_address]} #{machine.display_address}", nil)
    speak(PHRASES[:vm_confirm], CONFIRM_LOCATION)
  else
    speak(PHRASES[:vm_no_machine], nil)
  end
end

def message_contains_location?(message)
  if attachments = message.attachments
    attachments.first['type'] == 'location'
  else
    false
  end
end

def locate_user(message)
  coords = message.attachments.first['payload']['coordinates']
  lat = coords['lat']
  long = coords['long']
  #message.reply(text: "Coordinates of your location: Latitude #{lat}, Longitude #{long}.")
  [lat, long]
end

def display_menu(message, fb_user)
  if fb_user.pos_machine_id.present?
    machine = VendingMachine.find(fb_user.pos_machine_id)
    product_loads = machine.current_load
    mnu_elements = product_loads.map {|pl| mnu_element(pl.menu_name, pl, fb_user)}
    message.reply(product_menu(mnu_elements)) unless mnu_elements.empty?
  end
end

def update_user_profile(fb_user)
  user_profile(fb_user)
end

def user_profile(fb_user)
  response = HTTParty.get(user_profile_api(fb_user.sender_id))
  parsed = JSON.parse(response.body)
  fb_user.update(
    first_name: parsed["first_name"],
    last_name: parsed["last_name"]
  ) unless parsed["error"]
end

def user_profile_api(sender_id)
  "https://graph.facebook.com/v2.6/#{sender_id}?access_token=#{ENV['PAGE_ACCESS_TOKEN']}"
end

listen
