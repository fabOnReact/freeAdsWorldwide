Rails.application.routes.draw do
	devise_for :users
	resources :companies, :companytypes
	get "companies/:id", to: 'companies#delete'

	root :to => "landings#index"
  
end
