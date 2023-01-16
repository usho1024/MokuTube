Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      resources :users, only: %i(update)
      resources :messages, only: %i(index)
      resources :rooms_users, only: %i(index)
      resources :rooms, only: %i(index show create)
    end
  end
end
