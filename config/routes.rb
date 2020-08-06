Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :users, param: :user_id
      resources :owns, only: [:create, :destroy]
      resources :wants, only: [:create, :destroy]
    end
  end

   get '*path', to: 'pages#index', via: :all
end
