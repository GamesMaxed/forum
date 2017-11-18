Rails.application.routes.draw do
  resources :posts
  resources :categories do
    resources :topics
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
