class SurveysController < ApplicationController

	 before_action :check_user_is_logged_in?

	def index
		if current_user.role == "admin"
			@surveys = Survey.paginate(page: params[:page])
		else
			@surveys = current_user.surveys
		end
	end

	def new
		@survey = Survey.new
	end

	def create
		@survey = Survey.new(params_survey)
		# @survey.user = current_user
		
		if @survey.save!
			redirect_to @survey
		else
			render 'new'
		end
	end

	def show
		@survey = Survey.find(params[:id])
	end

	def edit
		@survey = Survey.find(params[:id])
	end

	def update
		@survey = Survey.find(params[:id])
		if  status == "expired"
			redirect_to surveys_path, error: "after expired user can't edit form"
		else
			if @survey.update(params_survey)
				redirect_to @survey
			else
				render 'new'
			end
		end
	end

	def destroy
		@survey = Survey.find(params[:id])
		@survey.destroy

		redirect_to surveys_path
	end

	private
	def check_user_is_logged_in?
		authenticate_user! if current_user.nil?
	end

	def params_survey
		params.require(:survey).permit(:name, :biography, :gender, :province, :status, :due_date, :user_id, :interest =>[])
	end
end

