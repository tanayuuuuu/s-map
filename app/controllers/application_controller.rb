class ApplicationController < ActionController::Base



  def map
    respond_to do |format|
      map.js
    end
  end

end
