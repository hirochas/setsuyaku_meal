class Admin::ResipesController < ApplicationController
  def show
    @resipe = Resipe.find(params[:id])
    @comments = @resipe.comments  #投稿詳細に関連付けてあるコメントを全取得
  end

  def index
    @resipes = Resipe.all
  end

  def resipe_params
    params.require(:resipe).permit(:customer_id, :genre_id, :image, :name, :cost, :item, :how_to_cook)
  end
end
