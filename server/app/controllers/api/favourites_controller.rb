class Api::FavouritesController < ApplicationController

  # GET /api/favourites
  def index
    render json: Favourites.all
  end

  # render all favourites
  # GET api/favourites/:stockSymbol
  def show
    render json: Favourites.where(stockSymbol: params[:id])
  end

  # add a favourite
  # POST api/favourites
  def create
    favourite = Favourites.create(stockSymbol: params[:stockSymbol], stockName: params[:stockName])
    favourite_valid = favourite.valid?
    if favourite_valid
      render json: { message: "Successfully added a new favourite!" }, status: 200
    else
      render json: { message: "Unable to add a new favourite!" }, status: 400
    end
  end

  # delete a favourite
  # DELETE api/favourites/:stockSymbol
  def destroy
    Favourites.where(stockSymbol: params[:id]).destroy_all
    render json: { message: "Favourite has been removed from list" }
  end
end
