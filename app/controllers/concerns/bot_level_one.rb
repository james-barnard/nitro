module BotLevelOne
  def create_part(callback)
    Part.create(
      mid:       callback.mid,
      seq:       callback.seq,
      meaning:   callback.text,
      type:      callback_type(callback),
      selection: nil
    )
  end

  def callback_type(callback)
    if callback.attachments &&
      callback.attachments.kind_of?(Array)
      callback.attachments[0].type
    end
  end

  def identified?
    @fbuser.first_name.present?
  end

  def identify_user(sender_id)
    profile = Messenger::Client.get_user_profile(sender_id)
    @fbuser.update(
      first_name: profile["first_name"],
      last_name: profile["last_name"]
    )
  end

  def greeting
#    pseudo = @fb_user.first_name || "there"
    pseudo = "there"
    "Hi #{pseudo}!"
  end

  def location_prompt
    Messenger::Request.new(
      Messenger::Templates::QuickReplies.new(
        text: "I would like to pour you some awesome coffee, but I need to know where you are. Do you mind?",
        quick_replies: [Messenger::Elements::QuickReply.new(content_type: 'location')]
      ),
      sender_id
    )
  end
end
