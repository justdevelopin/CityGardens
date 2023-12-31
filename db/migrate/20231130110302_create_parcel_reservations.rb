class CreateParcelReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :parcel_reservations do |t|
      t.references :parcel, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
