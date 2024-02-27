class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end

    def edit
      @place = Place.find(params[:id])
    end

    def update
      @place.update(place_params)
      @place = Place.find(params[:id])
      redirect_to place_path(@place)
    end
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :description, :price)
  end
end
