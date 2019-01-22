Rails.application.routes.draw do
  resources :drinks, only: [:index, :show]
  resources :user_drinks, except: [:create]
  post 'user_drinks/:id', to: "user_drinks#create", as: "user_drink_create"
  devise_for :users
  root to: 'drinks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
