Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  devise_for :users

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# Adding resources for Items Controller
  resources :items do
  	member do
  	patch :complete
  end
end

# Add route path for Items controller
	root 'items#index'
end