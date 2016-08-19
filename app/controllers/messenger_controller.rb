class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = nil

    if fb_params.first_entry.callback.message?
      request = case fb_params.first_entry.callback.text
      when /one/
        discovery1
      when /two/
        choices1
      when /three/
        request_text("three")
      when /four/
        request_text("four")
      when /five/
        request_text("five")
      when /six/
        request_text("six")
      when /seven/
        request_text("seven")
      end
    end

    Messenger::Client.send( request || request_text("Say again?"))
    render nothing: true, status: 200
  end
end
