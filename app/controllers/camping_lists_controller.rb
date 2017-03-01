class CampingListsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @camping_lists = @user.camping_lists
  end

  def show
    @camping_lists = CampingList.find_by_id(params[:id])
  end

  def create
    new_list = CampingList.new(post_params)
    @user = User.find_by_id(params[:id])
    @camping_lists = CampingList.create(post_params)
    new_list.user = current_user
    @camping_lists = new_list.save
    redirect_to user_path(params[:id])
  end

  def new
    @camping_lists = CampingList.new
    @user = User.find_by_id(params[:id])
  end



  private
  def post_params
    params.require(:camping_list).permit(:item)
  end

end
