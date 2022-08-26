# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles do
    post :mark_as_read, on: :member
    post :mark_as_liked, on: :member
    get :total_likes_count, on: :collection
    get :total_read_artilces_count, on: :collection

    resources :comments
  end

  resources :categories
  resources :blogs
  get '/ping', to: 'ping#info', as: 'ping'
  get '/error_info', to: 'ping#error_info'
  # root 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
