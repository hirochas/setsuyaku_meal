class Customer::ResipesController < ApplicationController
  def new
    @resipe = Resipe.new
  end

  def create
    @resipe = Resipe.new(resipe_params)
    @resipe.customer_id = current_customer.id
    if @resipe.save
      redirect_to resipe_path(@resipe.id)
    else
      render :new
    end
  end

  def index
    @resipes = Resipe.all
    if params[:genre_id].present?
      @resipes = Resipe.where(genre_id:params[:genre_id])
    end
  end

  def show
    @resipe = Resipe.find(params[:id])
    @comments = @resipe.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  def edit
    @resipe = Resipe.find(params[:id])
  end

  def update
    resipe = Resipe.find(params[:id])
    resipe.update(resipe_params)
    redirect_to resipe_path(resipe.id)
  end

  def resipe_params
    params.require(:resipe).permit(:customer_id, :genre_id, :image, :name, :cost, :item, :how_to_cook, :content)
  end
end
