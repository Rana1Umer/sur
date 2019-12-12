Rails.application.routes.draw do
	
	root to: 'surveys#index'
	resources :surveys

	devise_for :users, controllers: {
		sessions: 'users/sessions', 
		confirmations: 'confirmations',
		omniauth_callbacks: 'users/omniauth_callbacks'
	}

	scope "/admin" do
  		resources :users
	end

end