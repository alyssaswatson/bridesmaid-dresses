Rails.application.routes.draw do
  resources :brides, only: [:index, :show, :new] do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :index, :show]
  end

  resources :dresses, only: [:index, :new, :show]

  root 'brides#index'
end
