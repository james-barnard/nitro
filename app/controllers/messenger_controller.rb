class MessengerController < Messenger::MessengerController
  include BotHelper

  def webhook
    request = request_text("Hello!")

    @level = meter(fb_params)

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
      when /meter/i
        request_text(level)
      when /hello/i
        request_text("At what location may I serve you today?")
      when /buy/i
        fb_request(choices2)
      end
    end

    Messenger::Client.send( request || request_text("Hello"))

    render nothing: true, status: 200
  end
end
