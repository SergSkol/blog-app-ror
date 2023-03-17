Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  namespace :api do
    get '/users/:user_id/posts', to: 'posts#index'
    get '/users/:user_id/posts/:post_id/comments', to: 'comments#index'
    post '/comments', to: 'comments#create'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
