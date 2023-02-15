Rails.application.routes.draw do
  
  namespace :api do
    resources :carts, only: [:show, :destroy] do
      resources :cart_items, except: [:index, :show] 
    end
    resources :products
    resources :users, only: [:create, :show]
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
