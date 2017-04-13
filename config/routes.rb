Rails.application.routes.draw do
  root :to => "landings#index"
  get "tests/index", to: 'tests#index'
end
