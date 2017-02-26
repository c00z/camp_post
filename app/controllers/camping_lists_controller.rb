class CampingListsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @camping_lists = @user.camping_lists
  end

  def create
    new_list = List.new(list_params)
    @user = User.find_by_id(params[:id])
    @camping_lists = CampingList.create(list_params)
    new_list.user = current_user
  end

  def new
    @camping_lists = List.new
    @user = User.find_by_id(params[:id])
  end


  private
  def list_params
    params.require(:camping_lists).permit(:item)
  end

end
