class Member::AddressesController < ApplicationController
	# before_action :authenticate_user!
    # before_action :correct_book, only: [:edit, :update]
    # memberと紐付けしてから上記追加　0606minowa

	def index
		@address = Address.new
		@addresses = Address.all
		# @addressedit = Address.find(params[:id])
	end

	def create
		@address = Address.new(address_params)
		if @address.save
		   redirect_to addresses_path(@address), notice: "successfully created Address!"
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
  	params.require(:address).permit(:postal_code, :address, :address_name)
  end

end
