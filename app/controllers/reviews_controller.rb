class ReviewsController < ApplicationController
  def new
    @creature = Creature.find(params[:creature_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @creature = Creature.find(params[:creature_id])
    @review.creature = @creature
    @review.user = current_user
    if @review.save
      redirect_to creature_path(@creature)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to creature_path(@review.creature)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
