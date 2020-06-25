Rails.application.routes.draw do
  resources :users
root :to => "static#home"
resources :sights

get "/:page" => "static#show"

end

