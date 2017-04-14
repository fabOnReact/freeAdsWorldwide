Rails.application.routes.draw do
  devise_for :users
  root :to => "landings#index"
  get "tests/index", to: 'tests#index'
end
