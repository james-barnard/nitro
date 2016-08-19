class MessengerController < Messenger::MessengerController
  def webhook
    puts "Messenger:DEBUG: #{params.inspect}"
    #logic here
    Messenger::Client.send(
        Messenger::Request.new(
          Messenger::Elements::Text.new(text: 'we are on a roll!'),
          fb_params.first_entry.sender_id
        )
      )
    #
    render nothing: true, status: 200
  end
end
