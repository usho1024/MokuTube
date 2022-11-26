Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
    namespace :v1 do
      resources :users, only:[:index]
    end
  end
end
