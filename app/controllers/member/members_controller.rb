class Member::MembersController < ApplicationController
	def top
		@items = Item.all
	end

	def show
	end

	def edit
		@member = current_member
	end

	def update
		@member = current_member
		@member.update(member_params)
		redirect_to member_path(@member)
	end

	def hide
		@member = current_member
		@member.destroy
		redirect_to root_path
	end

	private
	def member_params
		params.require(:member).permit(:surname, :name, :kana_surname, :kana_name, :email, :postal_code, :address, :phone)
	end
end
