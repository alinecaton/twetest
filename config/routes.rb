Twetest::Application.routes.draw do
  root :to => "users#index"

  resources :users
  resources :tweets, only: [:create, :destroy]
end
