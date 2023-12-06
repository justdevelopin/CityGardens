class UsersController < ApplicationController
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end


    @gardens = @user.gardens
    @attending_events = @user.attending_events
    @events = @user.events
    @parcels = Parcel.where(garden_id: @gardens.pluck(:id))
    @parcel_reservations = @user.parcel_reservations.includes(:parcel)
  end
end
