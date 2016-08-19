class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = nil

    request = if fb_params.first_entry.callback.postback?
      puts "DEBUG:postback: #{fb_params.inspect}"
      fb_request(choices2)
    elsif fb_params.first_entry.callback.message?
      case fb_params.first_entry.callback.text
      when /one/
        discovery1
      when /two/
        fb_request(choices1)
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
