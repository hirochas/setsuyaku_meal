class Admin::CommentsController < ApplicationController
   def destroy
     @comment = Comment.find(params[:id]).destroy  # データ（レコード）を1件取得
      # データ（レコード）を削除
     redirect_back(fallback_location: root_path)   #コメント削除後は、一つ前のページへリダイレクトさせる。
   end
end
