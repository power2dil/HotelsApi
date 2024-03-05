1. List all hotels with feature to filter by location.
2. Allow users to book a room in a hotel by choosing no of rooms, check-in date, check-out
date etc.
3. Display the booked rooms to the user.
4. Allow users to modify the booking details (check-in, checkout dates etc.)
5. Allow user to cancel the booking.


User => name

Hotels => name, location, 
## Rooms => beds, type, 

Booking => user_id, check-in, checkou-out, booking status, 



rails generate scaffold User name:string email:string --api

rails generate scaffold Hotel::Location city:string state:string country:string pincode:integer --api

rails generate scaffold Hotel::Property name:string rating_score:float review_score:float location:references --api

rails generate scaffold Hotel::Booking  property:references user:references status:integer start_date:date end_date:date --api
