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
    user_id = params[:id]
    @user = User.find_by_id(user_id)
    # render :edit
  end

  def update
    user_id = params[:id]
    @user = User.find(user_id)
    if @user.update_attributes(user_params)
      flash[:notice] = "Updated successfully."
      redirect_to @user
    else
        flash[:error] = "nondescriptive unhelpful flash"

      redirect_to edit_user_path(@user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username)
  end

end
