class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = nil

    request = if fb_params.first_entry.callback.postback?
      puts "DEBUG:postback: #{fb_params.first_entry.inspect}"
      case fb_params.first_entry.callback.payload
      when /menu/
        fb_request(menu)
      else
        fb_request(choices1)
      end
    elsif fb_params.first_entry.callback.message?
      case fb_params.first_entry.callback.text
      when /one/i
        discovery1
      when /two/i
        fb_request(choices1)
      when /three/i
        request_text("three")
      when /four/i
        request_text("four")
      when /five/i
        request_text("five")
      when /six/i
        request_text("six")
      when /seven/i
        request_text("seven")
      end
    end

    Messenger::Client.send( request || request_text("Say again?"))
    render nothing: true, status: 200
  end
end
