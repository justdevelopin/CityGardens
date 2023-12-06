class AddDurationInMonthsToParcelReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :parcel_reservations, :duration_in_months, :integer, default: 1
  end
end
