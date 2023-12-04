class ParcelsController < ApplicationController
  before_action :set_garden, only: [:new, :create, :index]
  before_action :check_admin, only: [:new, :create, :index]


  def index
    @parcels = Parcel.all
    @parcels = @garden ? @garden.parcels : Parcel.all
  end

  def new
    @parcel = @garden.parcels.new
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @parcel = @garden.parcels.new(parcel_params)
    if @parcel.save
      redirect_to garden_path(@garden), notice: 'Parcel was successfully created.'
    else
      render :new
    end
  end

  def show
    @garden = Garden.find(params[:id])
  end



  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def parcel_params
    params.require(:parcel).permit(:name, :size, :other_attributes)
  end


  def check_admin
    redirect_to root_path, alert: "Not authorized" unless current_user == @garden.user
  end
end
