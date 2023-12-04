class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @show_list = params[:query].present?
    @events = if @show_list
                search_events(params[:query])
              else
                Event.all.includes(:garden).where.not(gardens: { latitude: nil, longitude: nil })
              end
    @markers = @events.map { |event| event_to_marker(event) }
    respond_to do |format|
      format.html
      format.json { render json: @markers }
    end
  end

  def search_events(query)
    sql_subquery = <<~SQL
      events.name ILIKE :query
      OR events.description ILIKE :query
      OR gardens.name ILIKE :query
      OR gardens.location ILIKE :query
      OR gardens.description ILIKE :query
    SQL
    Event.joins(:garden).includes(:garden).where(sql_subquery, query: "%#{query}%").where.not(gardens: { latitude: nil, longitude: nil })
  end

  def show
    @event = Event.find(params[:id])
    @already_booked = current_user.bookings.where(event: @event).any?
    @booking = Booking.new
    @markers = [{ lat: @event.garden.latitude, lng: @event.garden.longitude }]
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

  def event_to_marker(event)
    {
      lat: event.garden.latitude,
      lng: event.garden.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
      id: event.id
    }
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :max_attendees, :photo)
  end
end
