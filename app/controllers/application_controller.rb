class ApplicationController < ActionController::Base



  def map
    result = Geocorder.serach(params[:address])
    @latlng = results.first.cordinates
    respond_to do |format|
      map.js
    end
  end

end
