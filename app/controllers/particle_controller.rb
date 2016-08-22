class ParticleController < ApplicationController
  include HTTParty

  def buy
    puts "enable me!"
  end

  def enable
    @device_id = "350052000a51343334363138"
    @command = "nitroCmd"
    @access_token = "0d883762c8ef40bb26fa26cc5e30fc08788bc5e7"
    @url = "https://api.particle.io/v1/devices/#{@device_id}/#{@command}?access_token=#{@access_token}&arg=pour1"
    puts "this is where the fun happens"
    response = HTTParty.post(@url)
    puts response.inspect
  end
end
