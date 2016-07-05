json.array!(@people) do |person|
  json.extract! person, :id, :name, :cell_phone, :office_phone, :location_id, :organization_id
  json.url person_url(person, format: :json)
end
