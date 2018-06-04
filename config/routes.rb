Rails.application.routes.draw do
  resources :brides, only: [:index, :show, :new] do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :index, :show]
  end


end
