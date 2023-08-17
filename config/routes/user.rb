Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

    devise_scope :user do
        authenticated :user do
            root "users#homeUser",  as: :authenticated_user_root
        end
        unauthenticated :user do
            root 'users#testUser', as: :unauthenticated_user_root
        end
        get 'users/homeUser', to: 'users#homeUser', as: :user
        # get 'users/login', to: 'users/sessions#new'
        # get 'users/signup', to: 'users/registrations#new'
        # get 'users/sign_out', to: 'sessions#destroy'
    end
end
