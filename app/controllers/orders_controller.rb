class OrdersController < ApplicationController

	include CurrentCart
	before_action :set_cart, only: [:new, :create]
	before_action :set_order, only: [:show, :edit, :destroy]

	def index
		@orders = Order.all
		  @categories = Category.all
	end

	def new
		if @cart.product_items.empty?
			redirect_to shop_url, notice: 'Your Cart is Empty'
			return
		end
		@order = Order.new
		@client_token = Braintree::ClientToken.generate
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			charge
			if @result.success?
				@order.add_product_items_from_cart(@cart)
				Cart.destroy(session[:cart_id])
				session[:cart_id] = nil
				redirect_to root_url, notice: 'Thank You for Your order!'
			else
				flash[:error] = 'Please check your cart'
				redirect_to root_path, alert: @result.message
				@order.destroy
			end
		else
			@client_token = Braintree::ClientToken.generate
	render :new
	end
	end

	def show
		 @categories = Category.all
	end

	def destroy
		@order.destroy
		redirect_to root_url, notice: 'Order deleted'
	end

	private

	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:name, :email, :address, :city, :province)
	end

	def charge
		@result = Braintree::Transaction.sale(
			amount: @cart.total_price,
			payment_method_nonce: params[:payment_method_nonce] )
		end

	end
