class BookingsController < ApplicationController
  before_action :set_place, only: [:create, :show]
  before_action :authenticate_user!

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show; end

  def create
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.user = current_user
    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
