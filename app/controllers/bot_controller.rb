class BotController < ApplicationController
  def hello
    puts "DEBUG: #{params.inspect}"
    head :ok, content_type: "text/html"
    #
   #if params[‘hub.verify_token’] == “beehive.sceptre.oncolog”
     #render text: params[‘hub.challenge’] and return
   #else
     #render text: ‘error’ and return
   #end
  end
end
