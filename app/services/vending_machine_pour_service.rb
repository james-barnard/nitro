class VendingMachinePourService
  include HTTParty

  def self.enable(device_id, valve)
    #device_id = "350052000a51343334363138"
    command = "nitroCmd"
    access_token = ENV['PARTICLE_ACCESS_TOKEN']
    url = "https://api.particle.io/v1/devices/#{device_id}/#{command}?access_token=#{access_token}&arg=P#{valve}"
    puts "this is where the party starts: #{url}"

    begin
      HTTParty.post(url)
    rescue
      false
    end
  end
end
