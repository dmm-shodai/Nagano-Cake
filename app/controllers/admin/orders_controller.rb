class Admin::OrdersController < ApplicationController
		before_action :authenticate_admin!
		def index
		@orders = Order.all
	    end
	    

	    def show
	    @order = Order.find(params[:id])
	    end

	    def update
	    @order = Order.find(params[:id])
	    end

	 private
	 def order_params
	     params.require(:order).permit(:member_id, :postage, :payment, :order_status, :bill, :postal_code, :address, :address_name)
	end
end
