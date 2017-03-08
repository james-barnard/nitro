class ParticleController < ApplicationController
  include HTTParty
  protect_from_forgery except: :pour

  def pour
    machine = VendingMachine.find_by_device_id params["device_id"]
    valve  = params["data"][-1].to_i
    unless machine.nil? || valve.nil?
      puts "poured from valve: #{valve} on machine: #{machine.model}"
      product_load = ProductLoad.find_by_pour(vending_machine_id: machine.id, valve: valve).first
      product_load.increment!(:poured) unless product_load.nil?
    end

    head :ok, content_type: "text/html"
  end

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
