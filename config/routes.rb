Rails.application.routes.draw do
  resources :roles
  resources :permissions
  resources :role_permissions
  resources :app_configs
  resources :users
end
