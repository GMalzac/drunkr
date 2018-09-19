Rails.application.routes.draw do
  get 'user_drinks/index'
  get 'user_drinks/show'
  get 'user_drinks/new'
  get 'user_drinks/:id', to: "user_drinks#create", as: "user_drinks_create"
  get 'user_drinks/destroy'
  get 'drinks', to: 'drinks#index'
  get 'drinks/:id', to: 'drinks#show', as: "drink"
  devise_for :users
  root to: 'drinks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
