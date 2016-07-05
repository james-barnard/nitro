json.array!(@pos_vehicles) do |pos_vehicle|
  json.extract! pos_vehicle, :id, :name, :access_code, :url
  json.url pos_vehicle_url(pos_vehicle, format: :json)
end
