Rails.application.routes.draw do
  root 'homes#index'
  resources :teams, only: [:index, :create, :new]
  resources :weeks, only: [:index, :new, :create, :show]
  resources :rankings, only: [:index, :new, :create]


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
