class Admin::ItemsController < ApplicationController
	def index
		@items = Item.all
	end
	def new
		@item_new = Item.new
	end
	def create
		@item_new = Item.new(item_params)
		@item_new.genre_id = params[:item][:genre_id]
		@item_new.save
		redirect_to admin_items_path
	end
	def show
		@item = Item.find(params[:id])
	end
	def edit
	end
	def update
	end

	private
	def item_params
		params.require(:item).permit(:item_name,:price,:sale_status,:item_profile,:item_image,:genre_id)
	end
end
