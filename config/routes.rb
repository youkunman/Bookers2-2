Rails.application.routes.draw do
  get  'users/about' => 'users#about',as: 'user_about'
  #patch 'users/:id' => 'users#update', as: 'update_user'
  devise_for :users
  resources :users
  resources :books#, only: [:show, :new, :create, :indexs]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
end

