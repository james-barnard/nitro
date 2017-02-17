module ConversationHelper
  PHRASES = {
    thanks: 'Thanks for dropping by!',
    just_chat: 'So, you just want to hang out and chat? Tell me what\'s on your mind.',
    ask_location: 'I would like to pour you some awesome coffee. Will you send me your location, please?',
    vm_address: 'It looks like you\'re at',
    vm_confirm: 'Does this look like right?',
    vm_no_machine: "I can't seem to find a NitroKaffe machine close to you"
  }.freeze

  TYPE_LOCATION = [
    {
      content_type: 'location'
    },
    {
      content_type: 'text',
      title:        'Skip Location',
      payload:      'just_chat'
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

  GREETINGS = [
    'Hi there!',
    'Hey!',
    'Wassup?',
    'Did you jus wake me up?',
    'Sup?',
  ].freeze

  def greet_user(fb_user, text)
    speak(greeting(fb_user, text), nil)
  end

  def speak(text, quick_replies = nil)
    message_options = {
    recipient: { id:   @sender_id },
    message:   { text: text       }
    }

    message_options[:message][:quick_replies] = quick_replies if quick_replies

    Bot.deliver(message_options, access_token: ENV['ACCESS_TOKEN'])
  end

  def greeting(fb_user, text)
    name = fb_user.first_name
    prefix = GREETINGS[rand(GREETINGS.size)]
    name.nil? ? prefix : prefix.insert(-2, " #{name}")
  end

  def create_part(message, fb_user)
    fb_user.parts.create(
      fb_user_id: fb_user.id,
      mid:        message["mid"],
      seq:        message["seq"],
      meaning:    message["text"],
      part_type:  'text',
      selection:  nil
    )
  end
end

