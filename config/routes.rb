Rails.application.routes.draw do
  
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :entries do 
      resources :thoughts, only: [:create, :destroy]
    end
  end

  resources :cards, only: [:show]

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end
