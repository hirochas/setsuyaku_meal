class Customer::LikesController < ApplicationController

  def create
    resipe = Resipe.find(params[:resipe_id])
    like = current_customer.likes.new(resipe_id: resipe.id)
    like.save
    redirect_to resipe_path(resipe)
  end

  def destroy
    resipe = Resipe.find(params[:resipe_id])
    like = current_customer.likes.find_by(resipe_id: resipe.id)
    like.destroy
    redirect_to resipe_path(resipe)
  end
end
