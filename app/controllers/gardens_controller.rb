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
end
