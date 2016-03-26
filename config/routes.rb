Rails.application.routes.draw do
  root to: 'problems#index'

  resources :users, only: %i(new show create)
  resources :solutions, only: %i(index new show)
end
