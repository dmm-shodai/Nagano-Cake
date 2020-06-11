class Member::ItemsController < ApplicationController
	
	def index
		@items = Item.all.page(params[:page]).per(8)
		@genres = Genre.all
	end

	def show
		@genres = Genre.all
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
	end

	private
	def item_params
		params.require(:item).permit(:genre_id, :item_name, :price, :sale_status, :item_profile, :item_image)
	end
end
