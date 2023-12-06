class ParcelsController < ApplicationController
  before_action :check_admin, only: [:new, :create, :index]
  before_action :set_garden, only: [:new, :create]

  def index
    @parcels = Parcel.all
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @parcel = Parcel.new
    @parcel_reservation = ParcelReservation.new
  end


  def create
    @parcel = @garden.parcels.new(parcel_params)
    if @parcel.save
      redirect_to garden_path(@parcel.garden), notice: 'Parcel was successfully created.'
    else
      render :new
    end
  end

  def show
    @parcel = Parcel.find(params[:id])
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def parcel_params
    params.require(:parcel).permit(:garden_id, :name, :size, :photo)
  end

  def check_admin
    redirect_to root_path, alert: "Not authorized" unless current_user.is_admin?
  end
end
