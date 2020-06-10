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
	end
end
