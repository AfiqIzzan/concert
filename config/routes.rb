Rails.application.routes.draw do

  get 'cart' => 'carts#show', as: :cart
  post 'cart/add_all' => 'carts#add_all', as: :cart_add_all
  delete 'cart/line_item/delete/:id' => 'carts#delete', as: :cart_line_item_delete

  resources :orders
  resources :tickets
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
  draw :user
  draw :organizer
end
