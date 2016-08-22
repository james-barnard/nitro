class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = nil

    request = if fb_params.first_entry.callback.postback?
      puts "DEBUG:postback: #{fb_params.first_entry.inspect}"
      case fb_params.first_entry.callback.payload
      when /menu/
        fb_request(menu)
      when /BrewM1/i
        fb_request(enable(:brew1))
      when /BrewM2/i
        fb_request(enable(:brew2))
      else
        fb_request(choices1)
      end
    elsif fb_params.first_entry.callback.message?
      case fb_params.first_entry.callback.text
      when /hello/i
        fb_request(choices1)
      when /buy/i
        puts "responding to buy"
        fb_request(choices2)
      end
    end

    puts "responding OK"
    Messenger::Client.send( request || request_text("Say Hello Niki!"))

    render nothing: true, status: 200
  end
end
