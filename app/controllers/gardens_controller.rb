class GardensController < ApplicationController
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

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
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

  def garden_params
    params.require(:garden).permit(:name, :location, :description, :latitude, :longitude)
  end
end
