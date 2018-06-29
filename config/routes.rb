Rails.application.routes.draw do
  root 'brides#index' 
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  resources :brides, only: [:new, :create, :index, :show, :edit, :update] do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :create, :index, :show, :edit, :update]
  end

  resources :dresses, only: [:new, :create, :index, :show, :edit, :update]

  
end
