class Member::OrdersController < ApplicationController
	before_action :authenticate_member!

	def new
		@order = Order.new
		@address = Address.new
	end

	def index
		@orders = current_member.orders
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		@order = Order.new(session[:order])
		session[:order].clear
		@order.postage = 800
		@order.order_status = 0
		# current_member.cart_items.each do |cart_item|
		# 	@order.bill += bill商品テーブルの税込み?価格*カート内商品個数
		# end
		# 合憲金額出す
		@order.save
		current_member.cart_items.each do |cart_item|
			order_item = OrderItem.new(
				order_id: @order.id,
				number: cart_item.number,
				price: cart_item.item.price,
				production_status: 0,
			)
			order_item.save
		end
		current_member.cart_items.destroy_all
		redirect_to orders_thanks_path
	end

	def confirm
		@order = Order.new(order_params)
		@cart_items = CartItem.where(member_id: current_member.id)
		@total_price = 0
		@cart_items.each do |cart_item|
			@total_price += cart_item.item.price * cart_item.number
		end

		add = params[:order][:add]

		if add == "ご自身の住所"
			address = params[:order][:address]
			@address = Address.find_by(id: address)
			@order.address = current_member.address
			@order.address_name = current_member.full_name
			@order.postal_code = current_member.postal_code
		elsif add == "登録済み住所からの選択"
			address = params[:order][:address]
			@address = Address.find_by(id: address)
			@order.address = @address.address
            @order.address_name = @address.address_name
            @order.postal_code = @address.postal_code
		elsif add == "新しいお届け先"
			@address = Address.new(address_params)
			@address.save
			@order.address = @address.address
            @order.address_name = @address.address_name
            @order.postal_code = @address.postal_code
		end

		session[:order] = @order
		session[:order][:bill] = @total_price+800
		session[:order][:member_id] = current_member.id
	end

	def thanks
	end

	private
	def order_params
		params.require(:order).permit(:member_id, :postage, :payment, :order_status, :bill, :postal_code, :address, :address_name)
	end

	def address_params
  		params.require(:address).permit(:postal_code, :address, :address_name, :member_id)
  	end
end