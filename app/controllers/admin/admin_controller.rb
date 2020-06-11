class Admin::AdminController < ApplicationController

	def top
		range = Date.today.beginning_of_day..Date.today.end_of_day
        @todayorder = Order.where(created_at: range).count

	end

	def index
		@members = Member.with_deleted.all
	end

	def show
		@member = Member.with_deleted.find(params[:id])
	end   

	def edit 
		@member = Member.with_deleted.find(params[:id])
	end

	def update
		@member = Member.with_deleted.find(params[:id])
		if @member.update(member_params)
		 if   @member.quit == true
		      @member.restore
		      redirect_to admin_admin_index_path
	     else @member.quit == false 
	          @member.destroy
	          redirect_to admin_admin_index_path
	     end
	     else render "edit"
	    end

	end

	private
	def member_params
		params.require(:member).permit(:surname,:name,:kana_surname,:kana_name,:email,:postal_code,:adress,:phone,:quit)
    end
end
