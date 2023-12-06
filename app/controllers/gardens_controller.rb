class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :update, :destroy]

  def show
    @garden = Garden.find(params[:id])
    @review = Review.new
    reviews = Review.where(reviewable_type: "Garden")
    @garden_reviews = reviews.where(reviewable_id: @garden.id)
  end

  def index
    if params[:query].present?
        @gardens = search_gardens(params[:query])
    else
        @gardens = Garden.all
    end
  end


  def search_gardens(query)
    sql_subquery = "name ILIKE :query OR description ILIKE :query OR location ILIKE :query"
    Garden.where(sql_subquery, query: "%#{query}%")
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user

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
    params.require(:garden).permit(:name, :location, :description, :latitude, :longitude, photos: [])
  end
end
