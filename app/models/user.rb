class User < ApplicationRecord
	has_many :hotel_bookings, foreign_key: 'user_id', class_name: "Hotel::Booking"
end
