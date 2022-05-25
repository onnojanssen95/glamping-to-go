class ChangeGlampingSetsIdInBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :glamping_sets_id, :glamping_set_id
  end
end
