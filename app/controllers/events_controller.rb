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
    @event = Event.find(params[:garden_id])
    @already_booked = current_user.bookings.where(event: @event).any?
    @booking = Booking.new
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @event = @garden.events.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @event = @garden.events.new(event_params)
    if @event.save
      respond_to do |format|
        format.json { render json: { status: :created, event: @event } }
        format.html { redirect_to events_path, notice: "Booking was successfully created." }
      end
    else
      respond_to do |format|
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :max_attendees, :photo)
  end
end
