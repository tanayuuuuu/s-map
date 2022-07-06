class Post < ApplicationRecord
  has_one_attached :image

  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy

  def new
    @post = Post.new
    @category = Category.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to "map_request_path"
  end

  private

  def post_params
    params.require(:post).permit(:name[])
  end

end
