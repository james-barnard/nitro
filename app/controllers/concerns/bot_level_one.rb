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

  def location_prompt(fp_params)
    Messenger::Request.new(
      Messenger::Templates::QuickReplies.new(
        text: "#{greeting}! I would like to pour you some awesome coffee, but I need to know where you are. Do you mind?",
        quick_replies: [Messenger::Elements::QuickReply.new(content_type: 'location')]
      ),
      sender_id
    )
  end
end
