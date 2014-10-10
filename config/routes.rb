PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: :destroy do
    resources :categories, only: :create
  end

  resources :categories, only: [:new, :create, :show]
end
