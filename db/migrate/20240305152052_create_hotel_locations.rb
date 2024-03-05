class CreateHotelLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :hotel_locations do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode

      t.timestamps
    end
  end
end
