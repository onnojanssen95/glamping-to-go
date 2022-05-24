class ChangeStartDateInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :start_Date, :start_date
  end
end
