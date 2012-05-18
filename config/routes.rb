Clippy::Application.routes.draw do
  get "users/index"

  devise_for :users do
    get "/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
    get "/sign_in" => "devise/sessions#new", :as => :new_user_session
  end
  
  # Sample resource route within a namespace:
  namespace :api do
    namespace :v1  do
      post :clips
      get :clips
    end
  end
  
  resources :users

  get "home/index"

  root :to => 'home#index'

end
