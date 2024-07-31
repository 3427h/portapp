Rails.application.routes.draw do
  get "top", to: "homes#top"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users
  resources :tasks
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
