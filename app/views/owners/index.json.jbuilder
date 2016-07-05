json.array!(@owners) do |owner|
  json.extract! owner, :id, :name, :cell_phone, :office_phone, :location_id, :organization_id
  json.url owner_url(owner, format: :json)
end
