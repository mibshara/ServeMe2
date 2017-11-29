class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index, :show, :contact, :about, :shop]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:number].to_i)
  end

  def contact
    @contactPage = Page.find(1)
  end

  def about
     @aboutPage = Page.find(2)
  end

  def shop
      if params[:search]
      @products = Product.search(params[:search])
      else
      @products = Product.all
      end
    end
end
