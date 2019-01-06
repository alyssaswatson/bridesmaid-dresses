Rails.application.routes.draw do
  root 'brides#index' 
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/auth/facebook/callback", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  get "/dresses/longest", to: "dresses#longest"

  resources :brides, only: [:new, :create, :index, :show, :edit, :update] do
    # nested resource
    resources :bridesmaids, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  resources :dresses, only: [:new, :create, :index, :show, :edit, :update] do
    resources :comments
  end
end
