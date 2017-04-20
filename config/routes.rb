Rails.application.routes.draw do
  devise_for :users
  resources :tests, :companies, :companytypes
  #get "tests/index", to: 'tests#index'
  root :to => "landings#index"
  
end
