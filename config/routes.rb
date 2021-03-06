Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:{
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :posts

  root 'home#index'
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
