Rails.application.routes.draw do
  resources :articles
  resources :categories
  get '/ping', to: 'ping#info', as: 'ping'
  get '/error_info', to: 'ping#error_info'
  # root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
