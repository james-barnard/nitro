class BotController < ApplicationController
  @page_access_token = 'EAAY4gi2TZC6QBAGECh9GqOLOC1vqeeqFoCTFNIHTVRL0CAZC9OCABAcXJprfEnSmkNZAXesabT6kGNYsWmUHG7gZA0hVhbGDJ76rppz6OeTXSssNTGY2rG7ECnaaxjavr9UfojSvPnEDwFoOdr3oyAwXuCobatYh1X60mHiZA8wZDZD'

  def chat
    puts "DEBUG: #{params.inspect}"

   if params['hub.verify_token'] == 'beehive.sceptre.oncolog'
     render text: params['hub.challenge'] and return
   else
     render text: 'error' and return
   end
  end
end
