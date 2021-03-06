class ReviewsController < ApplicationController

  before_filter :require_login
  
  def create
    @review = Review.new(review_params)
    @review.product_id = params.require(:product_id)
    @review.user_id = session[:current_user]['id']
    

    if @review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Thanks for you review!'
    else
      flash.notice = "Oops! There was an error adding your review"
      redirect_to '/register'
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}", notice: 'Review deleted!'
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

  def require_login
    unless session[:current_user]
      flash.notice = 'Oops! You must be logged in to add a review'
      redirect_to '/login'
    end
  end

end
