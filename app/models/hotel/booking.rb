class Hotel::Booking < ApplicationRecord
  belongs_to :hotel_property, class_name: "Hotel::Property"
  belongs_to :user
end
