Rails.application.routes.draw do
  devise_for :users
  root to: 'applications#index'
  resources :applications, only: [ :index, :edit, :update, :show, :new, :create ] do
    resources :cover_paras, only: [ :create, :update, :destroy ]
    resources :values, only: [ :create, :destroy ]
    resources :competencies, only: [ :create, :destroy ]
  end
  resources :jobs, only: [ :index, :edit, :update ] do
    resources :bulletpoints, only: :create
    resources :quotes, only: :create
  end
  resources :bulletpoints, only: [ :destroy, :update ]
  resources :quotes, only: [ :destroy, :update ]
  post '/applications/:application_id/values/create', to: 'values#create_new', as: :create_new_value
  post '/applications/:application_id/competencies/create', to: 'competencies#create_new', as: :create_new_competency
end
