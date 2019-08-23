Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :marks

  resources :workspaces do
    get :token, on: :collection
  end
end
