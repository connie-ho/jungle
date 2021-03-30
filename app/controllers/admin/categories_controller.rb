class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def index
    @categories = Category.joins(:products).select('categories.*, COUNT(products.id) as product_count').group('categories.id')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Product.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :description
    )
  end
end
