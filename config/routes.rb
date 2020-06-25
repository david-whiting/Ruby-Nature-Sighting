Rails.application.routes.draw do
root :to => "static#home"
resources :sights

get "/:page" => "static#show"

end

