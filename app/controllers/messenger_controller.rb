class MessengerController < Messenger::MessengerController
  def webhook
    puts "Messenger:DEBUG: #{params.inspect}"
    puts "Messenger:DEBUG:fb_params: #{fb_params.inspect}"
    response_text = "Say again?"

    if fb_params.first_entry.callback.message?
      case fb_params.first_entry.callback.text
      when /one/
        response_text = "one"
      when /two/
        response_text = "two"
      when /three/
        response_text = "three"
      when /four/
        response_text = "four"
      when /five/
        response_text = "five"
      when /six/
        response_text = "six"
      when /seven/
        response_text = "seven"
      end
    end
    Messenger::Client.send(
        Messenger::Request.new(
          Messenger::Elements::Text.new(text: "#{response_text}"),
          fb_params.first_entry.sender_id
        )
      )
    render nothing: true, status: 200
  end
end
