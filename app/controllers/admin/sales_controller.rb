class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
  end

  def create
  end
end
