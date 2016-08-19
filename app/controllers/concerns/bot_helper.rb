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
end
