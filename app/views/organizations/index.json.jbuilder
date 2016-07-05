json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :cell_phone, :office_phone, :location_id
  json.url organization_url(organization, format: :json)
end
