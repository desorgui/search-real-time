Rails.application.routes.draw do
  resources :searches
  resources :articles
  root "articles#index"
end
