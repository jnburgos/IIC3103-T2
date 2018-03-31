Rails.application.routes.draw do

  devise_for :users
  resources :opinions
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  get "dashboard", to: "posts#dashboard"
end
