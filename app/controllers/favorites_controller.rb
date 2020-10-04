class FavoritesController < ApplicationController

  def create
    favorite = Book.new(params[:id])
    favorite.save
    redirect_to book_favorites_path
  end

  def destroy
    favorite.destroy
    redirect_to 'Show'
  end
end
