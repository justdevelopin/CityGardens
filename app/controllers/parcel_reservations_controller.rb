class ParcelReservationsController < ApplicationController
  def update
    @parcel_reservation = ParcelReservation.find(params[:id])
    if @parcel_reservation.update(parcel_reservation_params)
      redirect_to parcels_path, notice: 'Reservation status updated!.'
    end
  end

  def new
    @parcel = Parcel.find(params[:parcel_id])
    @garden = @parcel.garden
    @parcel_reservation = ParcelReservation.new

  end

  def create
    @parcel_reservation = ParcelReservation.new
    @parcel_reservation.user = current_user
    @parcel_reservation.parcel = Parcel.find(params[:parcel_id])


    if @parcel_reservation.save
      redirect_to user_profile_path, notice: 'Reservation was successfully created.'
    else

      render :new
    end
  end

  private

end
