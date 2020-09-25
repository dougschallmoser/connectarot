Rails.application.routes.draw do
  root 'welcome#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, except: [:show, :new] do
    resources :entries, shallow: true do 
      resources :thoughts, only: [:create, :destroy]
    end
  end

  resources :cards, only: [:show, :index]
  resources :requests, except: [:edit]

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
