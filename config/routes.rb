Rails.application.routes.draw do
  root to: 'dashboards#index'

  resources :users, only: %i(new show create)
  resources :problems, only: %i(index show) do
    resources :solutions, only: %i(index new show create)
  end
end
