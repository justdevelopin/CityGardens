class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all.includes(:garden).where.not(gardens: { latitude: nil, longitude: nil })
    @markers = @events.map do |event|
      {
        lat: event.garden.latitude,
        lng: event.garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        id: event.id
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @already_booked = current_user.bookings.where(event: @event).any?
    @booking = Booking.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :max_attendees, :photo)
  end
end
