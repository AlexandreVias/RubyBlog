Rails.application.routes.draw do
  resources :users do
    resources :posts, controller: 'users/posts'
  end

  resources :posts
end
