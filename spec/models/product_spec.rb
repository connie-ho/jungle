require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save successfully if all four fields are present' do
      @category = Category.create(name:'category')
      @product = Product.create(name: 'product', price: 10000, quantity: 1, category: @category)
      expect(@product.errors.any?).to eq(false)
    end
    
    # validates :name, presence: true
    it 'should not save if the name is not present' do
      @category = Category.create(name: 'category')
      @product = Product.create(price: 10000, quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # validates :price, presence: true
    it 'should not save if the price is not present' do
      @category = Category.create(name: 'category')
      @product = Product.create(name: 'product', quantity: 1, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # validates :quantity, presence: true
    it 'should not save if the price is not present' do
      @category = Category.create(name: 'category')
      @product = Product.create(name: 'product', price: 10000, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end


    # validates :category, presence: true
    it 'should not save if the category is not present' do
      @category = Category.create(name: 'category')
      @product = Product.create(name: 'product', price:10000, quantity: 1)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
