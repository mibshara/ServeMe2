class CategoriesController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:index, :show, :shop]
  def index
      @categories = Category.all
  end

  def show
      @category = Category.find(params[:number])
  end
  
end
