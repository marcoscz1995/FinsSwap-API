Rails.application.routes.draw do
  root 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :users, param: :user_id 
      resources :sessions, only: [:create]
      resources :matches, param: :user_id
      resources :exams, param: :course_code
      resources :owns, only: [:create, :destroy]
      resources :wants, only: [:create, :destroy]
      resources :algorithms
    end
  end

   get '*path', to: 'pages#index', via: :all
end
