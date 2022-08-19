Rails.application.routes.draw do
  resources :articles
  get '/ping', to: 'ping#info', as: 'ping'
  # root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
