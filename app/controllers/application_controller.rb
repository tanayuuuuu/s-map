class ApplicationController < ActionController::Base

before_action :get_gmap_post


  def map
    result = Geocoder.search(params[:address])
    @latlng = result.first.coordinates
    # format.js
    # render :map
    render 'layouts/map'

  end


  private

  def get_gmap_post
    @posts = Post.all
  end
end
