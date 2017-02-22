class ReviewsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @campsites = @user.campsites
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  def create

  end

  def new
    @review = Review.new
    @campsite = Campsite.find_by_id(params[:id])
  end


  def edit
    review_id = params[:id]
    @review = Review.find_by_id(review_id)
  end

  def update

  end

  def destroy
    review_id = params[:id]
    @review = Review.find(review_id)
    @campsite = Review.find_by_id(params[:id]).campsite
    @review.destroy
    redirect_to campsite_path(@campsite)
  end

  private
  def post_params
    params.require(:review).permit(:title, :description)
  end

end
