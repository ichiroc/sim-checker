Rails.application.routes.draw do
  devise_for :users
  # TODO: 後で存在するパスに変える
  root to: 'home#index'
end
