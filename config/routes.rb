Rails.application.routes.draw do
  resources :brides do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :create, :index, :show]
  end

  resources :dresses, only: [:index, :new, :show, :create]

  #root 'dresses#index'
end
