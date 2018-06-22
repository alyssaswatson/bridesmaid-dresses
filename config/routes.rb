Rails.application.routes.draw do
  resources :brides, only: [:new, :create, :index, :show, :edit, :update] do
    # nested resource for posts
    resources :bridesmaids, only: [:new, :create, :index, :show, :edit, :update]
  end

  resources :dresses, only: [:new, :create, :index, :show, :edit, :update]

  #root 'dresses#index'
end
