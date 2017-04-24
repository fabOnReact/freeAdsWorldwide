Rails.application.routes.draw do
	devise_for :users
	resources :companies, :companytypes
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'

	root :to => "landings#index"
  
end
