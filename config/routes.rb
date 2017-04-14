Rails.application.routes.draw do
  devise_for :users
  resource :tests
  get "tests/index", to: 'tests#index'
  root :to => "landings#index"
  
end
