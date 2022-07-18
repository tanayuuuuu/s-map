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
    @posts = Post.all
  end

  def destroy
    Comment.find(params[:id]).destroy
   # redirect_to post_path

  end

  private

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end
end
