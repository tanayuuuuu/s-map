class PostsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:place_name, :body, :latitude, :longitude)
  end

end
