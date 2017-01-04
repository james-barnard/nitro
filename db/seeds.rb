User.create!([
  {email: "james.barnard.co@gmail.com", password: "Password123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-12-06 17:56:21", last_sign_in_at: "2016-12-06 17:56:21", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: nil, role: 0},
  {email: "routeman@gmail.com", password: "Password123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-12-13 00:01:28", last_sign_in_at: "2016-12-12 16:52:44", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: nil, role: 3}
])
Region.create!([
  {name: "Denver", description: "Dave's Denver Region"}
])
Person.create!([
  {name: "Joe Brewer", cell_phone: "123-234-3445", office_phone: "", location_id: nil, organization_id: nil}
])
Brewery.create!([
  {region_id: 1, name: "Triple Shot Brewery", person_id: 1}
])
Product.create!([
  {name: "product B", description: "Another fine brew just like the other"},
  {name: "product A", description: "a fine brew like no other"},
  {name: "product C", description: "better that grade C"}
])
LocalProduct.create!([
  {product_id: 1, brewery_id: 1, region_id: 1},
  {product_id: 2, brewery_id: 1, region_id: 1},
  {product_id: 3, brewery_id: 1, region_id: 1},
  {product_id: 2, brewery_id: 1, region_id: 1}
])
Location.create!([
  {name: "home", address_1: "6207 S 296th East Ave", address_2: "", city: "Broken Arrow", state: "OK", postal_code: "74014", lat: "36.0609", long: "-95.7975"},
  {name: "Pivotal Labs Downtown", address_1: "1644 Platte Street", address_2: "", city: "Denver", state: "CO", postal_code: " 80202", lat: "39.742043", long: "-104.991531"},
  {name: "Exxon", address_1: "123 Main St", address_2: "", city: "Tulsa", state: "OK", postal_code: "74012", lat: "567890.0", long: "987654.0"},
  {name: "Mobil", address_1: "4567 Easy", address_2: "", city: "Broken Arrow", state: "OK", postal_code: "74014", lat: "567.0", long: "9876.0"},
  {name: "Garmin HQ", address_1: "0976", address_2: "", city: "Broken Arrow", state: "OK", postal_code: "74013", lat: "2345.0", long: "9876.0"}
])
Route.create!([
  {name: "route1", description: "dl route 1", user_id: 1},
  {name: "route2", description: "james tulsa route", user_id: 2},
  {name: "james route", description: "yup another", user_id: 1}
])
VendingMachine.create!([
  {model: "bluevase", firmware_version: "1.0", location_id: 1, route_id: 1, owner: "dl", last_serviced: "2016-12-07 17:09:00"},
  {model: "101", firmware_version: "1.0", location_id: 3, route_id: 1, owner: "DL", last_serviced: "2016-12-14 18:19:00"},
  {model: "2", firmware_version: "1.0", location_id: 4, route_id: 2, owner: "jb", last_serviced: "2016-12-14 18:20:00"},
  {model: "2", firmware_version: "1.0", location_id: 5, route_id: 2, owner: "jb", last_serviced: "2016-12-14 18:21:00"},
  {model: "1", firmware_version: "1.0", location_id: 5, route_id: 2, owner: "jb", last_serviced: "2016-12-14 18:22:00"},
  {model: "1", firmware_version: "1.0", location_id: 4, route_id: 2, owner: "jb", last_serviced: "2016-12-14 18:22:00"}
])
ProductLoad.create!([
  {local_product_id: 2, vending_machine_id: 1, total_pours: 45, date_loaded: "2016-12-15 22:04:00"},
  {local_product_id: 1, vending_machine_id: 1, total_pours: 34, date_loaded: "2016-12-15 22:17:00"},
  {local_product_id: 3, vending_machine_id: 3, total_pours: 34, date_loaded: "2016-12-15 22:17:00"},
  {local_product_id: 1, vending_machine_id: 3, total_pours: 45, date_loaded: "2016-12-02 22:18:00"},
  {local_product_id: 3, vending_machine_id: 4, total_pours: 34, date_loaded: "2016-12-25 18:18:00"}
])
