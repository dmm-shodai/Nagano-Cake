class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected
	def after_sign_in_path_for(resource)
		case resource
		when Member
             root_path
	    when Admin
	    	 admin_top_path
	    end		
	end

	def after_sign_out_path_for(resource)
        root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :name, :kana_surname, :kana_name, :email, :postal_code, :address, :phone])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
