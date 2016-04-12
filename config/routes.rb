Rails.application.routes.draw do
  root to: 'problems#index'

  resources :tasks, only: %i(new create show)
  resources :users, only: %i(new show create)
  resources :problems, only: %i(index show) do
    resources :solutions, only: %i(index new show create)
  end
end
