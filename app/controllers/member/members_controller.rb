class Member::MembersController < ApplicationController
	def top
	end

	def show
	end

	def edit
		
	end

	def hide
		@members = current_members
		@members.destroy
		redirect_to root_path
	end

	private
	def member_params
		params.require(:member).permit(:surname, :name, :kana_surname, :kana_name, :postal_code, :address, :phone, :quit)
	end
end
