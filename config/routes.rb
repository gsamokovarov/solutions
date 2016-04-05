Rails.application.routes.draw do
  root to: 'problems#index'

  resources :users, only: %i(new show create)
  resources :problems, only: %i() do
    resources :solutions, only: %i(index new show create)
  end
end
