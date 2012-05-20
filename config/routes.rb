Clippy::Application.routes.draw do

  resources :oauth_clients

  match '/oauth/test_request',  :to => 'oauth#test_request',  :as => :test_request

  match '/oauth/token',         :to => 'oauth#token',         :as => :token

  match '/oauth/access_token',  :to => 'oauth#access_token',  :as => :access_token

  match '/oauth/request_token', :to => 'oauth#request_token', :as => :request_token

  match '/oauth/authorize',     :to => 'oauth#authorize',     :as => :authorize

  match '/oauth',               :to => 'oauth#index',         :as => :oauth

  resources :authentications
  
  devise_for :users, :controllers => { :registrations => 'registrations' } do
    get "/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    get "/sign_in" => "devise/sessions#new", :as => :new_user_session
  end
  
  # Sample resource route within a namespace:
  namespace :api do
    namespace :v1  do
      match "data" => "data#show"
      resources :users, :only => [:show] do
        member do
          get 'feed'
          post 'clip'
        end
      end
      resources :clips
    end
  end

  resources :clips, :only =>[:create, :destroy]
  resources :users, :only => [:show]
  
  match '/auth/:provider/callback', to: 'authentications#create'
  # match '/auth/failure', :to => 'authentications#failure'
  # 
  # # Provider stuff
  # match '/auth/clippit/authorize' => 'auth#authorize'
  # match '/auth/clippit/access_token' => 'auth#access_token'
  # match '/auth/clippit/user' => 'auth#user'
  # match '/oauth/token' => 'auth#access_token'
  
  #match "/signout" => "sessions#destroy", :as => :signout

  #get "home/index"

  root :to => 'home#index'

end
