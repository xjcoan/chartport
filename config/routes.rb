Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions, :patients

  # define root page
  root 'pages#index'
  get 'about' => 'pages#about'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'dashboard' => 'users#dashboard'

  get 'users/:id/export' => 'users#exportjson'

  get 'patients/:id/export' => 'users#exportpatient'

  get 'patient/:id/import' => 'users#importpatient'
  post 'patient/:id/import' => 'users#importpatient'

  get 'importui' => 'users#importsearch'
end
