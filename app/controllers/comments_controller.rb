class CommentsController < ApplicationController


  def create     #paramsは中間テーブルのためpost_idから取得
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to user_post_path(@post.user, @post)
  end

  def index
    @post= Post.find(params[:post_id])
    @comments = @post.comments.page(params[:page]).per(4)

  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    if @comment.destroy      #２０行目書かないのであれば@comment.post_idを引数にしてもＯＫ
      redirect_to user_post_comments_path(@comment.user, post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end
end
