class CommentsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = @post.id
    comment.save
    redirect_to user_post_path(@post.user, @post)
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:comment_contents)
  end
end
