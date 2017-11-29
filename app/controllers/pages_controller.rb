class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index, :shop]

  def index
    @products = Product.all
  end

  def shop
      if params[:search]
      @products = Product.search(params[:search])
      else
      @products = Product.all

      end
end
end
