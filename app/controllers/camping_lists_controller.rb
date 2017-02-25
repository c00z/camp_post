class CampingListsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @camping_lists = @user.camping_lists
  end

  def create
    @camping_lists = CampingList.create(list_params)
  end


  private
  def list_params
    params.require(:camping_lists).permit(:item)
  end

end
