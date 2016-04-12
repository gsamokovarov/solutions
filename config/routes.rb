Rails.application.routes.draw do
  root to: 'dashboards#index'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create' 
  get '/logout', to:'sessions#destroy'

  resources :users, only: %i(new show create)
  resources :problems, only: %i(index show) do
    resources :solutions, only: %i(index new show create)
  end
  resources :tasks, only: %i(new create index show destroy)
end
