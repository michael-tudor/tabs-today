Rails.application.routes.draw do
  devise_for :users

  root 'marks#index'

  resources :marks

  resources :workspaces do
    get :token, on: :collection
  end
end
