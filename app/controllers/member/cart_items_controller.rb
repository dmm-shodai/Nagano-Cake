class Member::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.member_id = current_member.id
		@cart_item.save
		# if文で分岐させる
		redirect_to cart_items_path
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end

	def index
		@cart_item = CartItem.new
		@cart_items = CartItem.where(member_id: current_member)
		@total_price = 0
		@cart_items.each do |cart_item|
			@total_price += cart_item.item.price * cart_item.number
		end
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		@cart_items = CartItem.where(member_id: current_member)
		@cart_items.destroy_all
		redirect_to cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:item_id, :number, :member_id)
	end

end

# find:id １つのidのみ  where:id以外のカラムを複数　find_by:id以外のカラムも抜けだせる　１つだけもっていける（whereとの違い）
