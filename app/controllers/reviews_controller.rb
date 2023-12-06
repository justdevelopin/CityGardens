class ReviewsController < ApplicationController
  def create
    @garden = Garden.find(params[:garden_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.reviewable = @garden

    if @review.save
      redirect_to garden_path(@garden), notice: "Review was saved"
    else
      redirect_to garden_path(@garden)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
