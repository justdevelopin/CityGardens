class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all.includes(:garden).where.not(gardens: { latitude: nil, longitude: nil })
    @show_list = params[:query].present?
    @markers = @events.map do |event|
      {
        lat: event.garden.latitude,
        lng: event.garden.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        id: event.id
      }
    end

    if params[:query].present?
      sql_subquery = <<~SQL
        events.name ILIKE :query
        OR events.description ILIKE :query
        OR gardens.name ILIKE :query
        OR gardens.location ILIKE :query
        OR gardens.description ILIKE :query
      SQL
      @events = @events.joins(:garden).where(sql_subquery, query: "%#{params[:query]}%")
    else
      @events = Event.all.includes(:garden).where.not(gardens: { latitude: nil, longitude: nil })
    end
  end
 

  def show
    @event = Event.find(params[:id])
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

