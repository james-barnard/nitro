json.array!(@product_loads) do |product_load|
  json.extract! product_load, :id, :local_product_id, :vending_machine_id, :total_pours, :date_loaded
  json.url product_load_url(product_load, format: :json)
end
