Rails.application.routes.draw do
  root 'marks#index'

  devise_for :users

  resources :marks
end
