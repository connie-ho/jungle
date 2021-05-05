class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.product_id = params.require(:product_id)
    @review.user_id = session[:current_user]['id']
    

    if @review.save
      flash.notice = "Thanks for your review!"
      redirect_to "/products/#{params[:product_id]}"
    else
      flash.notice = "Oops! There was an error adding your review"
      redirect_to '/register'
    end
  
  
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end

end
