class Admin::CommentsController < ApplicationController
   def destroy
     @comment = Comment.find(params[:id])
     @comment.destroy  # データ（レコード）を1件取得
      # データ（レコード）を削除
     redirect_back(fallback_location: root_path)   #コメント削除後は、一つ前のページへリダイレクトさせる。
   end

#   def comment_params
#     params.require(:comment).permit(:comment_content).merge(resipe_id: params[:resipe_id], customer_id: current_customer.id)  #formにてresipe_idパラメータを送信して、コメントへresipe_idを格納するようにする必要がある。
#   end
end
