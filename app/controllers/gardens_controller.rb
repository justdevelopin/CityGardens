class GardensController < ApplicationController

  def show
    @garden = Garden.find(params[:id])
  end

  def index
    @gardens = Garden.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude
      }
    end
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :description, :location)
  end
end
