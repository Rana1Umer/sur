Rails.application.routes.draw do
	devise_for :users, controllers: {
		# sessions: 'users/sessions'
		confirmations: 'confirmations'
	}

	devise_for :users, skip: :all

	devise_scope :user do
		get 'sign_in', to: 'devise/sessions#new'
		get '/users/sign_out' => 'devise/sessions#destroy'
	end
	#devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

	root to: 'surveys#index'


	resources :surveys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
