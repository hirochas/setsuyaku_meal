class Customer::GenresController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @resipes = @genre.resipe.order(created_at: :desc).all
    else
      @resipes = Resipe.order(created_at: :desc).all
    end
  end
end
