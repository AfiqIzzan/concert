Rails.application.routes.draw do
    devise_for :organizers, :controllers => {:registrations => "organizers/registrations", sessions: "organizers/sessions" }

    devise_scope :organizer do
        authenticated :organizer do
            root "organizer#myEvents",  as: :authenticated_organizer_root
        end
        unauthenticated :organizer do
            root 'organizers#testOrganizer', as: :unauthenticated_organizer_root
        end
        get 'organizer/myEvents', to: 'organizers#myEvents'
        get 'organizer/dashboard', to: 'organizers#dashboard'
        # get 'organizers/login', to: 'organizers/sessions#new'
        # get 'organizers/signup', to: 'organizers/registrations#new'
        # get 'organizers/sign_out', to: 'sessions#destroy'
    end
end
