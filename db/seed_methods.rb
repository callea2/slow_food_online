def create_restaurant_categories(rest_cats)
  rest_cats.each do |category|
    RestaurantCategory.create(title: category)
  end
end

def create_restaurant(args = {})
  suffix = %W(Place Parlor House Bar Food\ Court Pub)
  prefix = %w(The Local Homemade)
  cat = RestaurantCategory.all.sample
  name = "#{prefix.sample} #{cat.title} #{suffix.sample}"
  description = args[:description] || Faker::Lorem.paragraph(2)
  address = args[:address] || [Faker::Address.street_address, Faker::Address.postcode, Faker::Address.city].join(', ')
  phone_number = args[:phone] || Faker::PhoneNumber.cell_phone
  lat = rand(59.0000001..59.4000009).round(7)
  lon = rand(18.0000001..18.4000009).round(7)
  rest = Restaurant.new(name: name,
                    description: description,
                    address: address,
                    phone: phone_number,
                    restaurant_category: cat,
                    latitude: lat,
                    longitude: lon)
  rest.save(validate: false)
end