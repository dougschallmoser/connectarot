Rails.application.routes.draw do
  
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users do
    resources :entries
  end

end
