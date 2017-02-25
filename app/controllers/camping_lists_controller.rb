class CampingListsController < ApplicationController

def index
  @user = User.find(params[:id])
  @camping_lists = @user.camping_lists
end



end
