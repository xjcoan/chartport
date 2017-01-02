Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :sessions, :patients, :medications, :hospitals

  # define root page
  root 'pages#index'

  get 'error' => 'pages#errorpage'

  get 'about' => 'pages#about'

  get 'signup' => 'users#new'

  get 'registeradmin' => 'users#newadmin'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  get 'dashboard' => 'users#dashboard'

  get 'users/:id/export' => 'users#exportjson'

  get 'patient/:id/import' => 'patients#importpatient'
  post 'patient/:id/import' => 'patients#importpatient'

  get 'importui' => 'patients#importsearch'

  get 'patientindex' => 'patients#adminindex'

  get ':invalid' => 'pages#errorpage'
end
