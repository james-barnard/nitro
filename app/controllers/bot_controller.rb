class BotController < ApplicationController
  def hello
    puts "DEBUG: #{params.inspect}"
   if params['hub'] && params[‘hub.verify_token’] == “beehive.sceptre.oncolog”
     render text: params[‘hub.challenge’] and return
   else
     render text: 'error' and return
   end
  end
end
