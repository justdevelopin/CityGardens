class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def show
    @garden = Garden.find(params[:id])
    @review = Review.new
    reviews = Review.where(reviewable_type: "Garden")
    @garden_reviews = reviews.where(reviewable_id: @garden.id)
  end

  def index
    @gardens = Garden.all

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


  def edit

  end


  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to @garden, notice: 'Garden was successfully created.'
    else
      render :new
    end
  end

  def update
    if @garden.update(garden_params)
      redirect_to @garden, notice: 'Garden was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @garden.destroy
    redirect_to gardens_url, notice: 'Garden was successfully destroyed.'
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end


  def garden_params
    params.require(:garden).permit(:name, :location, :description, :latitude, :longitude)
  end
end
