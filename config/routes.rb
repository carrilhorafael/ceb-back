Rails.application.routes.draw do
  resources :restaurants
  post 'auth/sign_up'
  post 'auth/login'
  post 'auth/forgot'
  post 'auth/reset'
  post 'auth/confirm'
  post 'auth/resend_confirmation'
  post 'users/deliverman'
  resources :users, except: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
