Rails.application.routes.draw do
  root to: 'recipes#index'

  get '/ingredients/search', to: 'ingredients#search'

  resources :recipes do
    resources :tags
  end

  resources :ingredients do
    collection { get 'search'}
  end

  resources :tags do
    collection { get 'search'}
  end
end
