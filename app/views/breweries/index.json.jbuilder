json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :region_id, :name, :person_id
  json.url brewery_url(brewery, format: :json)
end
