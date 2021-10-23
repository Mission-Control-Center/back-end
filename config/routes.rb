Rails.application.routes.draw do
  resources :users
  
  resources :app_configs, only: %i[index show create destroy restore] do
    get 'restore', to: 'app_configs#restore', on: :member
    resources :app_meta_infos, only: %i[show create update]
    resources :app_roles, only: %i[index show create destroy]
  end

  resources :roles, only: %i[index show create update destroy] do
    resources :role_permissions
  end
  resources :permissions, only: %i[index show create update destroy]
end
