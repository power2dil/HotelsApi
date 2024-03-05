# Hotels sample seeding data 

require 'faker'

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

10.times do
  Hotel::Location.create(
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    pincode: Faker::Address.zip_code
  )
end

puts "Data Seeding"

80.times do
  location = Hotel::Location.all.sample
  puts location.city
  Hotel::Property.create!(
    name: Faker::Company.name,
    rating_score: rand(1.0..5.0).round(2),
    review_score: rand(1.0..5.0).round(2),
    hotel_location_id: location.id
  )
end

10.times do
  property = Hotel::Property.all.sample
  user = User.first
  start_date = Faker::Date.between(from: Date.today, to: Date.today + 30.days)
  end_date = Faker::Date.between(from: start_date + 1.day, to: start_date + 5.days)
  status = rand(0..2) # Assuming status values 0, 1, 2 for simplicity

  Hotel::Booking.create!(
    hotel_property: property,
    user: user,
    status: status,
    start_date: start_date,
    end_date: end_date
  )
end

80.times do
  property = Hotel::Property.all.sample
  user = User.all.sample
  start_date = Faker::Date.between(from: Date.today, to: Date.today + 30.days)
  end_date = Faker::Date.between(from: start_date + 1.day, to: start_date + 5.days)
  status = rand(0..2) # Assuming status values 0, 1, 2 for simplicity

  Hotel::Booking.create!(
    hotel_property: property,
    user: user,
    status: status,
    start_date: start_date,
    end_date: end_date
  )
end