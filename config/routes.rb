Rails.application.routes.draw do
  get "/crimes/data/:state_id/:crime_id", to: "crimes#oregon"
  resources :states
  resources :arrests
  resources :categories
  resources :crimes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
