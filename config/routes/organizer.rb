Rails.application.routes.draw do
    devise_for :organizers, :controllers => {:registrations => "organizers/registrations", sessions: "organizers/sessions" }

    devise_scope :organizer do
        authenticated :organizer do
            root "organizers#myEvent",  as: :authenticated_organizer_root
        end
        unauthenticated :organizer do
            root 'organizers#testOrganizer', as: :unauthenticated_organizer_root
        end
        get 'organizers/myEvent', to: 'organizers#myEvent'
        # get 'organizers/login', to: 'organizers/sessions#new'
        # get 'organizers/signup', to: 'organizers/registrations#new'
        # get 'organizers/sign_out', to: 'sessions#destroy'
    end
end
