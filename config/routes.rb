Rails.application.routes.draw do
root :to => "static#home"

resources :users, :only => [:new, :create] 
resources :sights

get "/:page" => "static#show"

end
