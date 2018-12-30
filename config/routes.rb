Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               sessions: 'users/sessions'
             }
  root to: 'visitors#index'

  resource :setting, only: %i[edit update] do
    resource :iijmio_token, only: %i[show create], module: :settings
  end
end
