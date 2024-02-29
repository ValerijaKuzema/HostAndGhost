class ReviewsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])

    if review_available?(current_user, @place)
      @review = Review.new(review_params)
      @review.user = current_user
      @review.place = @place
    if @review.save
        redirect_to place_path(@place) , notice: "You"

    end
  else
  end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def review_available?(user, place)
    place.reviews.each do |review|
      return false if review.user == user
    end

    place.bookings.each do |booking|
      return true if booking.user == user
    end

    return false
  end
end
