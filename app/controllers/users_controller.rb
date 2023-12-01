class UsersController < ApplicationController
  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end

    @gardens = @user.gardens
    @attending_events = @user.attending_events
    @events = @user.events
    # @events = Event.joins(:garden).where()
  end
end
