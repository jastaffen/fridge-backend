Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :ingredients, only: [:index, :create]
      resources :recipes
      resources :user_ingredients
      resources :user_recipes, only: [:index]
      post '/login', to: 'auth#create'
      
    end
  end
end
