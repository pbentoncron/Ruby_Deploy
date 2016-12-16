Rails.application.routes.draw do
 
	resources :users, except: [:destroy] 
	resources :sessions, only: [:create, :destroy]
    resources :ideas
    post '/likes' => 'likes#create'
	root 'users#index'
end
