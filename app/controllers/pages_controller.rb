class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index, :shop, :show]

  def index
    @products = Product.all
  end

  def show

    @product = Product.find(params[:number].to_i)
  end

  def shop
      if params[:search]
      @products = Product.search(params[:search])
      else
      @products = Product.all

      end
end
end
