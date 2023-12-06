class BookmarksController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.new
    @garden = Garden.find(params[:garden_id])
    @bookmark.garden = @garden
    @bookmark.user = current_user
    if @bookmark.save!
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    respond_to do |format|
      format.json
    end
  end
end
