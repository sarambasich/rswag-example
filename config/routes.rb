Rails.application.routes.draw do
  get 'plants/index'
  get 'plants/show'
  get 'plants/create'
  get 'plants/update'
  get 'plants/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
