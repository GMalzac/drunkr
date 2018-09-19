Rails.application.routes.draw do
  get 'drinks', to: 'drinks#index'
  get 'drinks/:id', to: 'drinks#show', as: "drink"
  devise_for :users
  root to: 'drinks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
