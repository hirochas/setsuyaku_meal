class Customer::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @resipes = Resipe.all.order(created_at: :desc).limit(5)
  end

end
