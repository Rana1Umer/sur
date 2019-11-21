Rails.application.routes.draw do
	
	root to: 'surveys#index'
	resources :surveys

	# Devise specific routes
	devise_for :users, controllers: {
		sessions: 'users/sessions',
		confirmations: 'confirmations'
	}

	scope "/admin" do
  		resources :users
	end	
end