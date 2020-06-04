class Member::AddressesController < ApplicationController

	def index
		@address = Address.new
		@addressess = Addresses.all
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
