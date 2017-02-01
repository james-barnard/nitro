require "facebook/messenger"

include Facebook::Messenger
include BotLevelOne
include BotHelper

API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?address='.freeze
REVERSE_API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='.freeze

PHRASES = {
  hello: 'Hi there',
  ask_location: 'I would like to pour you some awesome coffee, but I need to know where you are. Do you mind?',
  menu_prompt: 'Would you like to see a menu?',
  vm_address: 'This looks like our closest NitroKaffe machine',
  vm_confirm: 'Does this look like right?',
  vm_no_machine: "I can't seem to find a NitroKaffe machine close to you"
}.freeze

TYPE_LOCATION = [{ content_type: 'location' }]
MENU_RESPONSES = [
  {
    content_type: 'text',
    title:        'YES',
    payload:      'yes_menu'
  },
  {
    content_type: 'text',
    title:        'NO',
    payload:      'no_menu'
  }
]
CONFIRM_LOCATION = [
  {
    content_type: 'text',
    title:        'YES',
    payload:      'location_confirmed'
  },
  {
    content_type: 'text',
    title:        'NO',
    payload:      'no_location'
  }
]

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

def listen
  Bot.on :message do |message|
    puts "Received '#{message.inspect}' from #{message.sender}" # debug only

    @sender_id = message.sender['id']
    @fbuser = FbUser.find_or_create_by(sender_id: @sender_id)

    create_part(message.messaging["message"])

    if message_contains_location?(message)
      connect_user_with_vending_machine(message)
    elsif message.quick_reply && message.quick_reply == "location_confirmed"
      puts "location confirmed!"
      if @fbuser.pos_machine_id.present?
        @fbuser.update(pos_confirmed: true)
      end
      speak(PHRASES[:menu_prompt], MENU_RESPONSES)
    elsif message.quick_reply && message.quick_reply == "yes_menu"
      puts "menu confirmed!"
      display_menu(message)
    elsif @fbuser.ungreeted?
      speak(PHRASES[:hello], nil)
    elsif @fbuser.not_located?
      speak(PHRASES[:ask_location], TYPE_LOCATION)
    elsif
      case message.text
      when /hello/i
        speak(PHRASES[:hello], nil)
      else
        puts "huh?"
      end
    end
  end
end

def connect_user_with_vending_machine(message)
  @lat, @long = locate_user(message)
  machine = VendingMachine.nearest_machine(@lat, @long)
  @fbuser.update(pos_machine_id: machine.id, pos_confirmed: false)

  if machine.present?
    speak("#{PHRASES[:vm_address]} #{machine.display_address}", nil)
    speak(PHRASES[:vm_confirm], CONFIRM_LOCATION)
  else
    speak(PHRASES[:vm_no_machine], nil)
  end
end

def speak(text, quick_replies = nil)
  message_options = {
  recipient: { id:   @sender_id },
  message:   { text: text         }
  }

  message_options[:message][:quick_replies] = quick_replies if quick_replies

  Bot.deliver(message_options, access_token: ENV['ACCESS_TOKEN'])
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
  message.reply(text: "Coordinates of your location: Latitude #{lat}, Longitude #{long}.")
  [lat, long]
end

def display_menu(message)
  if @fbuser.pos_machine_id.present?
    machine = VendingMachine.find(@fbuser.pos_machine_id)
    products = machine.current_load
    mnu_elements = products.map {|p| mnu_element(p.menu_name, p.local_product.product.image.url)}
    products.map {|p| puts(p.local_product.product.image.url) }
    #products.map {|p| display_image(message,p.local_product.product.image.url) }
    message.reply(product_menu(mnu_elements)) unless mnu_elements.empty?
  end
end
listen
