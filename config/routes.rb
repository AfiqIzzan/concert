Rails.application.routes.draw do
  get 'order', to: 'order#show'
  post 'order/add'
  post 'order/remove'
  

  resources :tickets
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  draw :user
  draw :organizer
end
