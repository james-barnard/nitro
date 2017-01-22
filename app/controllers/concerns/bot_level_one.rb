module BotLevelOne
  def identify_user(fb_params)
    profile = Messenger::Client.get_user_profile(sender_id)
    @first_name = profile["first_name"]
    @last_name  = profile["last_name"]
  end

  def greeting
    pseudo = @first_name || "there"
    "Hi #{pseudo}!"
  end

  def location_prompt
    "Can you show me where you are so I can help you find me?"
  end
end
