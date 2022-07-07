class ApplicationController < ActionController::Base


  def map
    result = Geocoder.search(params[:address])
    @latlng = result.first.coordinates
    # format.js
    # render :map
    render 'layouts/map'

  end
end
