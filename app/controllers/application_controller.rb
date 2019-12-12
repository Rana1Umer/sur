class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	add_flash_types :error
	#protect_from_forgery with: :exception

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
	end
end

