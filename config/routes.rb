Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"} 
  
  devise_scope :user do
    get 'users/:id', to: 'users/sessions#show', as: 'user'
  end
  resources :tickets
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  # draw :user
end
