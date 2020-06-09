class Admin::AdminController < ApplicationController

	def top
	end

	def index
		@members = Member.all
	end

	def show
	end   

	def edit 
	end

	def update
	end
end
