json.array!(@vending_machines) do |vending_machine|
  json.extract! vending_machine, :id, :model, :firmware_version, :location_id, :route_id, :owner, :last_serviced
  json.url vending_machine_url(vending_machine, format: :json)
end
