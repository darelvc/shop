Rails.application.routes.draw do
  namespace :api do
    resources :products, only: [:index, :show, :create, :update]

    resources :users, only: [:index, :show, :create]

    resource :profile, only: [:show, :update] do
      resource :avatar, only: :update
    end

    resources :purchases

    resource :session, only: [:create, :destroy]
  end
end
