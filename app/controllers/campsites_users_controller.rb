class CampsitesUsersController < ApplicationController

  # before_action :require_login, only: [:build]

  def build
    @campsite = Campsite.find_by_id((params[:campsite_id]))
    p params
    p "this is that thing"
    p @campsite
    @user = current_user
    @campsite.users << @user
    redirect_to :back
  end

end
