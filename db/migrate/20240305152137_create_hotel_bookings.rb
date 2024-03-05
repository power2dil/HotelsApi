class CreateHotelBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :hotel_bookings do |t|
      t.references :hotel_property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
