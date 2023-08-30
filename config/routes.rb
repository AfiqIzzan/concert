Rails.application.routes.draw do
  devise_for :organizers, :controllers => {:registrations => "organizers/registrations", :sessions => "organizers/sessions"}
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  # devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"} 
  resources :organizers
  # devise_scope :user do
  #   get 'users/:id', to: 'users/sessions#show', as: 'user'
  # end
  resources :admins
  resources :tickets
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  # draw :user
end
