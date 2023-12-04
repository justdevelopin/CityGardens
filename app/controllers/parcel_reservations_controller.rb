class ParcelReservationsController < ApplicationController
  def update
    @parcel_reservation = ParcelReservation.find(params[:id])
    if @parcel_reservation.update(parcel_reservation_params)
      redirect_to parcels_path, notice: 'Reservation status updated!.'
    end
  end

  private

  def parcel_reservation_params
    params.require(:parcel_reservation).permit(:status)
  end
end
