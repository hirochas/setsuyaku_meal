class Customer::FavoritesController < ApplicationController

  def create
   favorite = current_customer.favorites.build(resipe_id: params[:resipe_id])
   favorite.save!
    redirect_back(fallback_location: root_path)
  end

 def destroy
   customer = current_customer
   resipe = Resipe.find(params[:resipe_id])
   if favorite=Favorite.find_by(customer_id: customer.id,resipe_id:resipe.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
   else
    redirect_back(fallback_location: root_path)
   end
 end

  def index
    @customer = current_customer
    favorites = Favorite.where(customer_id: @customer.id).all
    #Resipe.where(id: [1, 2]) favorites = [favroite_1, favorite_2]
    @resipes = Resipe.where(id: favorites.map{|f| f.resipe_id})
  end

end


