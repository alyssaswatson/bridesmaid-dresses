Rails.application.routes.draw do
  resources :brides, only: [:show, :index, :new, :create] do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :index, :show]
  end

  resources :dresses, only: [:index, :new, :show, :create]

  root 'dresses#index'
end
