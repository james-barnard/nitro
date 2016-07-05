json.array!(@consumer_purchases) do |consumer_purchase|
  json.extract! consumer_purchase, :id, :consumer_id, :pos_vehicle_id, :product_load_id
  json.url consumer_purchase_url(consumer_purchase, format: :json)
end
