class CampsitesController < ApplicationController

  def index
    # @locations = Location.all
    # render :index
  end

  def show
    @campsites = Campsite.find_by_id(params[:id])
    # render :show
  end

end
