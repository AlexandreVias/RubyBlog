Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :posts, controller: 'users/posts' do
      resources :comments
    end
  end

  resources :posts

  root to: 'posts#index'
end
