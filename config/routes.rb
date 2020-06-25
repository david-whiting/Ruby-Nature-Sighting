Rails.application.routes.draw do
root :to => "static#home"

get '/login' => "sessions#new"
post '/sessions' => "sessions#create"
get '/logout' => "sessions#destroy"

resources :users, :only => [:new, :create] 
resources :sights
resources :categories

get "/:page" => "static#show"
end
