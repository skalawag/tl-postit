PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: :destroy do
    resources :comments, only: :create
  end

  resources :users, only: [:new, :create, :edit, :update, :show]

  post '/posts/:id/vote', to: 'posts#vote', as: :vote_post
  post '/comments/:id/vote', to: 'comments#vote', as: :vote_comment

  get 'register', to: 'users#new'
  get 'users/profile', to: 'users#show'
  resources :categories, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
