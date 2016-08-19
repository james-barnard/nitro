module BotHelper
  def sender_id
    fb_params.first_entry.sender_id
  end

  def fb_request(template)
    Messenger::Request.new(template, sender_id)
  end

  def request_text(text)
    fb_request(Messenger::Elements::Text.new(text: "#{text}"))
  end

  def discovery1
      request_text("I can show you insanely great NitroKaffe selections or just chat about nitro coffee.")
  end

  def choices1
    Messenger::Templates::Buttons.new(
      text: "I can show you insanely great NitroKaffe selections or just chat about nitro coffee.",
      buttons: [btn_menu, btn_chat]
    )
  end

  def choices2
    Messenger::Templates::Buttons.new(
      text: "I have a couple of great selections including something special from Novo Coffee in Denver!  May I show them to you?",
      buttons: [btn_menu]
    )
  end

  def btn_menu
    Messenger::Elements::Button.new(
      type: 'postback',
      title: 'NitroKaffe',
      value: 'menu'
    )
  end

  def btn_chat
    Messenger::Elements::Button.new(
      type: 'postback',
      title: 'Just Chat',
      value: 'chat1'
    )
  end
end
