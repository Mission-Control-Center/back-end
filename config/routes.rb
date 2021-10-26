Rails.application.routes.draw do
  resources :users
  post '/login', to: 'users#login'

  resources :app_configs, only: %i[index show create destroy restore] do
    get 'restore', to: 'app_configs#restore', on: :member
    get 'list_deleted', to: 'app_configs#deleted_index', on: :collection
    resources :app_meta_infos, only: %i[show create update]
    resources :app_roles, only: %i[index show create destroy]
  end
  
  resources :app_meta_infos, only: %i[index show create update]
  resources :app_roles, only: %i[index show create destroy]
  
  resources :roles, only: %i[index show create update destroy]
  resources :role_permissions
  resources :permissions, only: %i[index show create update destroy]
end
