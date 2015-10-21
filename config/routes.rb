Rails.application.routes.draw do
  get 'sign_up' => "users#new", :as => "sign_up"
  get 'login' => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get '/users/confirm_email/:confirm_token' => 'users#confirm_email', as: 'confirm'
  get 'welcome/index'
  get 'welcome/about'
  
  resources :users
  resources :sessions
  resources :password_resets
  root to: 'welcome#about'
end
