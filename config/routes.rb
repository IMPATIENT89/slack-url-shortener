Rails.application.routes. draw do
  root :to => "links#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :links, only: [:create, :show]
end
