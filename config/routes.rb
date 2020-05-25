Rails.application.routes.draw do
  get 'users/Books'
  devise_for :users
  resources :users
  resources :books
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :homes, only: [:index]
  get 'home/about' => 'homes#about'

end

