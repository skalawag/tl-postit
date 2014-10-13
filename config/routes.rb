PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: :destroy do
    resources :comments, only: :create
  end

  resources :users, only: [:new, :create, :edit, :update]

  post '/vote/post/:id', to: 'votes#post_vote'
  post '/vote/comment/:id', to: 'votes#comment_vote'

  get 'register', to: 'users#new'
  get 'users/profile', to: 'users#show'
  resources :categories, only: [:new, :create, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
