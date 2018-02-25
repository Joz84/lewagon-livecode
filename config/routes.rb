Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :batchs, only: [] do
    resources :repositories, only: [:index]
  end
end
