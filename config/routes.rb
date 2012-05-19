Clippy::Application.routes.draw do

  resources :profile, :only => [:edit, :update]

  #get "users/index"

  devise_for :users do
    get "/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    get "/sign_in" => "devise/sessions#new", :as => :new_user_session
  end
  
  # Sample resource route within a namespace:
  namespace :api do
    namespace :v1  do
      resources :users, :only => [:show] do
        member do
          get 'stream'
        end
      end
    end
  end

  resources :clips, :only =>[:create, :destroy]
  resources :users, :only => [:show] do
    member do
      get 'stream'
    end
  end

  get "home/index"

  root :to => 'home#index'

end
