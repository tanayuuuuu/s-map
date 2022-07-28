class ApplicationController < ActionController::Base

before_action :get_gmap_post
GOOGLEMAPS_API_KEY = ENV["API_KEY1"]
GEOCODER_API_KEY = ENV["API_KEY2"]


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
