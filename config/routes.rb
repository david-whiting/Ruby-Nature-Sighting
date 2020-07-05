Rails.application.routes.draw do

	root :to => "static#home"
	get '/login' => "sessions#new"
	post '/sessions' => "sessions#create"
	get '/logout' => "sessions#destroy"

	resources :sights
	resources :categories
	
	resources :users do
		resources :sights, only: [:show, :index, :new]
	end

	get "/:page" => "static#show"
	get '/auth/:provider/callback' => 'sessions#omniauth'
end

