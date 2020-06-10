class Member::OrdersController < ApplicationController

	def new
		@order = Order.new
		@address = Address.new
	end

	def index
	end

	def show
	end

	def create
	end

	def confirm
		@pay = params[:order][:card]
		@add = params[:order][:add]

		if @add == "ご自身の住所"
			address = params[:order][:address]
			@address = Address.find_by(id: address)
		elsif
			@add == "登録済み住所からの選択"
		elsif
			@add == "新しいお届け先"
		end
		render :confirm
	end

	def thanks
	end

	private
	def order_params
		params.require(:order).permit(:member_id, :postage, :payment, :order_status, :bill, :postal_code, :adress, :adress_name)
	end
end