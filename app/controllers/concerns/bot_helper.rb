module BotHelper
  def request_text(text)
    Messenger::Request.new(
      Messenger::Elements::Text.new(text: "#{text}"),
      fb_params.first_entry.sender_id
    )
  end

  def discovery1
      request_text("I can show you insanely great NitroKaffe selections or just chat about nitro coffee.")
  end

  def choices1
    Messenger::Templates::Buttons.new(
      text: "I can show you insanely great NitroKaffe selections or just chat about nitro coffee.",
      buttons: [
        Messenger::Elements::Button.new(
          type: 'postback',
          title: 'NitroKaffe',
          value: 'menu'
        ),
        Messenger::Elements::Button.new(
          type: 'postback',
          title: 'Just Chat',
          value: 'chat1'
        )
      ]
    )
  end
end
