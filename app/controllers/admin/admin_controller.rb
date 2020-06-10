class Admin::AdminController < ApplicationController

	def top
	end

	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end   

	def edit 
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
	end

	private
	def member_params
		params.require(:member).permit(:surname,:name,:kana_surname,:kana_name,:email,:postal_code,:adress,:phone,:quit)
    end
end
