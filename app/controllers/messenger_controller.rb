class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = request_text("Say Hello Niki!")

    request = if fb_params.first_entry.callback.postback?
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
        fb_request(choices2)
      end
    end

    #Messenger::Client.send( request || request_text("Say Hello Niki!"))

    render nothing: true, status: 200
  end
end
