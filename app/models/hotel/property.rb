class Hotel::Property < ApplicationRecord
  belongs_to :hotel_location, class_name: "Hotel::Location"
  has_many :hotel_bookings

end
