class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    end
    redirect_to user_posts_path
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.new
    if @post.update(post_params)
      redirect_to user_posts_path
    else
      render :index
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path
  end

  def update
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.joins(:post_categories).where('post_categories.category_id = ?', params[:name])
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:place_name, :body, :latitude, :longitude, :image, :name, category_ids: [])
  end

end
