class Member::CartItemsController < ApplicationController

	def create
		@cart_item = Cart_item.new(cart_item_params)
		@cart_item.member_id = current_member.id
	end

	def update
	end

	def index
	end

	def destroy
	end

	def destroy_all
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:item_id, :number)
	end
end
