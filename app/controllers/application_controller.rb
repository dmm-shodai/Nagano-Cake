class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def after_sign_in_path_for(resource)
		items_path
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, key: [:surname, :name, :kana_surname, :kana_name, :email, :postal_code, :address, :phone])
		devise_parameter_sanitizer.permit(:sign_in, key: [:email])
	end
end
