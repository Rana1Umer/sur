class UsersController < ApplicationController
	before_action :authorize_admin
	def new
	end

	private
	def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.role=="admin"
  end
end
