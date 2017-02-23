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
    review_id = params[:id]
    @review = Review.find(review_id)

    if @review.update_attributes(post_params)
      flash[:notice] = "Updated successfully."
      @campsite = Review.find_by_id(params[:id]).campsite
      redirect_to campsite_path(@campsite)
    else
      @review.errors.full_messages.each do |message|
        flash[:error] = message
      end
      redirect_to edit_review_path(@review)
    end
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
