Rails.application.routes.draw do
  resources :states
  resources :arrests
  resources :categories
  resources :crimes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
