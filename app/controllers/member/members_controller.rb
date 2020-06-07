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
	def member_paramus
		params.require(:member).permit(:)
	end
end
