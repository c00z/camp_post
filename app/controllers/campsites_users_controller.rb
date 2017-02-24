class CampsitesUsersController < ApplicationController

  before_action :require_login, only: [:build]

  def build
    @campsite = Campsite.find_by_id((params[:id]))
    @user = current_user
    @campsites.users << @user
    redirect_to :back
  end

end
