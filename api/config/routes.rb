Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      resources :homes, only: [:index]
      resources :users, only: [:show, :update]
      resources :messages, only: [:index]
      resources :rooms_users, only: [:index]
      resources :rooms, only: [:index, :show, :create]
      get :health_check, to: 'health_check#index'
    end
  end
end
