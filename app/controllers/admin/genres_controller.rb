class Admin::GenresController < ApplicationController
	def index
		@genres = Genre.all
		@genre_new = Genre.new
	end
	def create
		@genre_new = Genre.new(genre_params)
		@genre_new.save
		redirect_to admin_genres_path
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def update
	end
   private
  def genre_params 
  	  params.require(:genre).permit(:genre_name,:genre_status)
  end

end
