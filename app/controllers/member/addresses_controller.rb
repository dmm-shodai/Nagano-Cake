class Member::AddressesController < ApplicationController
	before_action :authenticate_member!


	def index
		@address = Address.new
		@addresses = current_member.addresses
	end

	def create
		@address = Address.new(address_params)
		@address.member_id = current_member.id
		if @address.save
		   redirect_to addresses_path, notice: "successfully created Address!"
	    else
	    	@addresses = Address.all
	    	render :index
	    end
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update(address_params)
		   redirect_to addresses_path, notice: "successfully update Address!"
		else
			render action: :edit
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path
	end

	private

  def address_params
  	params.require(:address).permit(:postal_code, :address, :address_name, :member_id)
  end

end
