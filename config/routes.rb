Rails.application.routes.draw do
  root 'homes#index'
  resources :teams, only: [:index, :create, :new]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
