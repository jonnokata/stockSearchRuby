class Api::FavouritesController < ApplicationController 

    
    def index
        render json: Favourites.all
      end

      # render all favourites
      def show
        puts params[:id]
        render json: Favourites.find(params[:id])
      end

      # add a favourite
      def create
        favourite = Favourites.create()
        favourite_valid = favourite.valid?
        if favourite_valid
          render json: {message: 'Successfully added a new favourite!'}, status: 200
        else
          render json: {message: 'Unable to add a new favourite!'}, status: 400
        end
      end

      # delete a favourite
      def destroy
        Favourites.destroy(params[:id])
        render json: {message: 'Favourite has been removed from list'}
      end



end

