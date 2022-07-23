class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_posts_path(@post.user)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def index
    @posts = Post.page(params[:page]).per(3)

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
    # @categories = Category.new
    if @post.update(post_params)
      redirect_to user_posts_path
    else
      render :index
    end
  end

  def search
    @posts = Post.joins(:post_categories).where('post_categories.category_id = ?', params[:name])
    render :index
  end

  private

  def post_params  #requireいらないのか？？？エラー確認箇所
    params.require(:post).permit(:place_name, :body, :latitude, :longitude, :image, :name, :user_id, category_ids: [])
  end

end
