class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.joins('INNER JOIN users ON users.id = reviews.user_id').select('reviews.*, users.first_name AS user_first_name, users.last_name AS user_last_name').where(product_id: @product.id)
    # raise @reviews.inspect
  end

end
