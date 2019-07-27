Rails.application.routes.draw do
  devise_for :users

  root 'marks#index'

  resources :marks
end
