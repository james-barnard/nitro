class MessengerController < Messenger::MessengerController
  def webhook
    puts "Messenger:DEBUG: #{params.inspect}"
    #logic here
    render nothing: true, status: 200
  end
end
