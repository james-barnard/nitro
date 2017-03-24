class VendingMachinePourService
  include HTTParty

  def self.enable(device_id, valve)
    command = "nitroCmd"
    access_token = ENV['PARTICLE_ACCESS_TOKEN']
    url = "https://api.particle.io/v1/devices/#{device_id}/#{command}"
    puts "enabling particle device id: #{device_id} valve: #{valve}"

    begin
      HTTParty.post(url, body: post_data(access_token, valve))
    rescue => e
      puts "failed enabling particle device: #{e.message}"
      false
    end
  end

  private
  def self.post_data(access_token, valve)
    {
      access_token: access_token,
      args: "P#{valve}"
    }
  end
end
