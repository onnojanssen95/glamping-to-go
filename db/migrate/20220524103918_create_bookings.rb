class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_Date
      t.date :end_date
      t.float :price_per_night
      t.string :pickup_type
      t.references :user, null: false, foreign_key: true
      t.references :glamping_sets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
