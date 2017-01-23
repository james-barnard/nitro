class MessengerController < Messenger::MessengerController
  include BotHelper
  include BotLevelOne

  def webhook
#    identify_user(fb_params) if @first_name.nil?

    request = if true
      request_text("Hello!")
    elsif fb_params.first_entry.callback.postback?
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
        request_text(meter(fb_params))
      when /hello/i
        request_text("Hello!")
        #location_prompt
      when /buy/i
        fb_request(choices2)
      end
    else
      request_text(fb_params.inspect)
    end

    Messenger::Client.send( request || request_text("Hello"))

    render nothing: true, status: 200
  end
end
