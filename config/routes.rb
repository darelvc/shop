Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :show, :create, :update, :destroy]

    resources :users, only: [:index, :show, :create]

    resource :profile, only: [:show, :update] do
      resource :avatar, only: :update
    end

    resources :purchases

    resources :orders, except: [:new, :update, :edit]

    resource :session, only: [:create, :destroy]
  end
end
