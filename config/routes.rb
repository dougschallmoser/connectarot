Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  resources :cards, only: [:show, :index]
  resources :requests, except: [:edit]
  resources :users, except: [:new] do
    resources :entries, shallow: true do 
      resources :thoughts, only: [:create, :destroy]
    end
  end
end
