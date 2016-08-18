class MessengerController < Messenger::MessengerController
  def webhook
    puts "Messenger:DEBUG: #{params.inspect}"
    if params['hub.verify_token'] == 'beehive.sceptre.oncolog'
     render text: params['hub.challenge'] and return
    else
     render text: 'error' and return
    end
  end
end
