class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new

  end

  def create

  end


  def edit

  end

  def update

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username)
  end


end
