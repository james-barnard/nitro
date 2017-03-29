require 'facebook/messenger'

include Facebook::Messenger
include ConversationHelper
include MenuHelper

API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?address='.freeze
REVERSE_API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='.freeze

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :postback do |postback|
  puts "Postback received '#{postback.inspect}' from #{postback.sender}" # debug only
  @sender_id = postback.sender['id']
  fb_user = FbUser.find_or_create_by(sender_id: @sender_id)

  case postback.payload
  when /THE_USUAL/
    confirm_the_usual(postback, fb_user)
  when /CHOICES/
    speak(PHRASES[:ask_location], TYPE_LOCATION)
  else
    puts "got a postback we didn't expect: #{postback.payload}"
  end
end

Bot.on :message do |message|
  puts "Message received '#{message.inspect}' from #{message.sender}" # debug only

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
    start_conversation(message, fb_user)
  elsif fb_user.not_located?
    start_conversation(message, fb_user)
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

def start_conversation(message, fb_user)
  update_user_profile(fb_user)
  greet_user(fb_user, message.text) # if fb_user.ungreeted?
  if fb_user.repeat_customer? && false
    display_choices(message, fb_user, PHRASES[:welcome_back])
  else
    prompt_for_location(fb_user)
    fb_user.update(loc_skipped: false)
  end
end

def confirm_the_usual(message, fb_user)
  speak(confirmation_msg(message, fb_user), nil)
  display_menu(message, fb_user)
end

def confirmation_msg(message, fb_user)
  ["#{PHRASES[:the_usual]} #{machine(fb_user).display_address}",
  "#{PHRASES[:last4]} #{credit_card(fb_user.last4)}",
  PHRASES[:select_from_menu]].join "\u000A"
end

def say_card(card)
    speak("#{PHRASES[:last4]} #{card}", nil)
end

def credit_card(number)
  "**** **** **** #{number}"
end

def say_location(machine)
    speak("#{PHRASES[:vm_address]} #{machine.display_address}", nil)
end

def machine(user)
  VendingMachine.find(user.pos_machine_id)
end

def connect_user_with_vending_machine(message, fb_user)
  @lat, @long = locate_user(message)
  machine = VendingMachine.nearest_machine(@lat, @long)
  fb_user.update(pos_machine_id: machine.try(:id), pos_confirmed: false)

  if machine.present?
    say_location(machine)
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
  FacebookMessengerConversationService.new(@sender_id).display_menu(message, fb_user)
end

def display_choices(message, fb_user, text)
    message.reply(choices(fb_user, text))
end

def choices(fb_user, text)
  {
    attachment:{
      type:"template",
      payload:{
        template_type:"button",
        text:text,
        buttons:[
          {
            title: 'THE USUAL',
            type:  'web_url',
            url:   link_to_confirm(fb_user),
            messenger_extensions: true,
            webview_height_ratio: "full"
          },
          {
            type:"postback",
            title:"Give Me Choices",
            payload:"CHOICES"
          }
        ]
      }
    }
  }
end

def update_user_profile(fb_user)
  response = HTTParty.get(user_profile_api(fb_user.sender_id))
  parsed = JSON.parse(response.body)
  puts "update_user_profile: #{parsed}"
  if parsed["error"]
    puts "error updating user profile: #{parsed['error']}"
  else
    fb_user.update(
      first_name: parsed["first_name"],
      last_name: parsed["last_name"]
    )
  end
end

def user_profile_api(sender_id)
  "https://graph.facebook.com/v2.6/#{sender_id}?access_token=#{ENV['PAGE_ACCESS_TOKEN']}"
end
