Rails.application.routes.draw do
	
	root to: 'surveys#index'
	resources :surveys
	resources :users
	# Devise specific routes

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		confirmations: 'confirmations'
	}



end
