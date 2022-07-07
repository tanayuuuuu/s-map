class PostsController < ApplicationController
  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # save成功時
      category_ids = params[:post][:post_categories]
      category_ids.each do |id|
        # 中間てーぶるへの挿入
      end
    end
    redirect_to user_posts_path
  end

  def edit
  end

  def index

  end

  def show
  end

  def destroy
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:place_name, :body, :latitude, :longitude, :image, :name)
  end

end
