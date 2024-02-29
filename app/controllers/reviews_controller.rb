class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.place = @place
    if @review.save
      puts "review #{@review}"
      redirect_to place_path(@place)
    else
      puts "review error #{@review}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
