class PlacesController < ApplicationController
  def index
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
    if params[:query].present?
      sql_subquery = <<~SQL
        places.title @@ :query
        OR places.description @@ :query
      SQL
      @places = @places.where(sql_subquery, query: params[:query])
    end
    if params[:price].present?
      sql_subquery = <<~SQL
        places.price < :price
      SQL
      @places = @places.where(sql_subquery, price: params[:price])
    end
  end

  def show
    @place = Place.find(params[:id])
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :description, :price, :photo)
  end
end
