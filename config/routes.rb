Rails.application.routes.draw do
  devise_for :users
  root to: 'applications#index'
  resources :applications, only: [ :index, :edit, :show, :new, :create ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
