Rails.application.routes.draw do
  get 'visitors/index'
  devise_for :users, controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks'
             }
  root to: 'visitors#index'
end
