class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:index, :show, :contact, :about, :shop, :search_results]

  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:number].to_i)
  end

  def contact
    @contactPage = Page.find(2)
  end

  def about
    @aboutPage = Page.find(1)
  end


  def shop
    @products = Product.all
    @categories = Category.all
  end

  def search_results
    @categories = Category.all
    if params[:categories] != ""
      @result = Product.search(params[:search]).where("category_id = ?", params[:categories])
    else
      @result = Product.search(params[:search])
    end
  end

end
