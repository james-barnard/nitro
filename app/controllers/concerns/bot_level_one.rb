module BotLevelOne
  def identify_user(fb_params)
    profile = Messenger::Client.get_user_profile(sender_id)
    @first_name = profile["first_name"]
    @last_name  = profile["last_name"]
  end
end
