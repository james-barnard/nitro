json.array!(@local_products) do |local_product|
  json.extract! local_product, :id, :product_id, :brewery_id, :region_id
  json.url local_product_url(local_product, format: :json)
end
