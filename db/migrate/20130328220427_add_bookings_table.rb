class AddBookingsTable < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.integer :client_id
      t.integer :medium_id
      t.integer :stylist_id
      t.timestamps
    end
  end
end
