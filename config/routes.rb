Rails.application.routes.draw do
  resources :payments
  resources :orders do 
    post :paymentredirect, on: :member
  end
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

  get 'cart' => 'carts#show', as: :cart
  post 'cart/add_all' => 'carts#add_all', as: :cart_add_all
  delete 'cart/line_item/delete/:id' => 'carts#delete', as: :cart_line_item_delete

  get '/paymentfailed' => 'orders#paymentfailed', :as => 'paymentfailed'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"
  # draw :user
end
