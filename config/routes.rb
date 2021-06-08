Rails.application.routes.draw do
  post 'auth/sign_up'
  post 'auth/login'
  resources :users, except: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
