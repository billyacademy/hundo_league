Rails.application.routes.draw do
  root 'homes#index'
  resources :teams, only: [:index, :create, :new]
  resources :weeks, only: [:index, :new, :create, :show]
  resources :rankings, only: [:index, :new, :create]
  resources :players, only: [:index, :show, :edit, :update, :create]
  resources :dynasty_teams, only: [:show, :index, :trade]
  resources :trades, only: [:index, :update, :create]
  match '/customview' => 'players#customview' , via: [:get]
  match '/players/:id/edit' => 'players#update', via: [:get, :post]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  match '/trade_post' => 'dynasty_teams#trade' , via: [:update]
end
