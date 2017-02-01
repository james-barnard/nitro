module BotLevelOne
  def create_part(message)
    @fbuser.parts.create(
      fb_user_id: @fbuser.id,
      mid:        message["mid"],
      seq:        message["seq"],
      meaning:    message["text"],
      part_type:  'text',
      selection:  nil
    )
  end

  def identified?
    @fbuser.first_name.present?
  end

#  def identify_user(callback)
#    profile = Messenger::Client.get_user_profile(sender_id)
#    @fbuser.update(
#      first_name: profile["first_name"],
#      last_name: profile["last_name"]
#    ) unless profile.nil?
#  end

  def greeting
    pseudo = @fbuser.first_name || "there"
    "Hi #{pseudo}!"
  end

end

