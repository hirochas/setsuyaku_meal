class Customer::CommentsController < ApplicationController
   def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_to root_path  #同上
    end

   end

private
  def comment_params
    params.require(:comment).permit(:comment_content).merge(resipe_id: params[:resipe_id], customer_id: current_customer.id)  #formにてresipe_idパラメータを送信して、コメントへresipe_idを格納するようにする必要がある。

  end
end