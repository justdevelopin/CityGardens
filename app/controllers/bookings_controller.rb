class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = Event.find(params[:event_id])

    if @booking.save
      respond_to do |format|
        format.json { render json: { status: :created, booking: @booking } }
        format.html { redirect_to @booking.event, notice: "Your booking has been confirmed!" }
      end
    else
      respond_to do |format|
        format.json { render json: @booking.errors, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:attendees)
  end
end
