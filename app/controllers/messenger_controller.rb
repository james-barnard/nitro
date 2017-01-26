class MessengerController < Messenger::MessengerController
  include BotHelper
  include BotLevelOne

  def webhook
    if params['hub.verify_token'] == 'beehive.sceptre.oncolog'
     render text: params['hub.challenge'] and return
    end

    @fbuser = FbUser.find_or_create_by(sender_id: sender_id)
    create_part(fb_params.first_entry.callback)

    identify_user(fb_params.first_entry.callback) unless identified?

    request = if @fbuser.ungreeted?
      request_text(greeting)
    elsif @fbuser.not_located?
      location_prompt
    end

    Messenger::Client.send( request || request_text("Hello"))
    render nothing: true, status: 200
  end

  def dummy
    if fb_params.first_entry.callback.postback?
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
