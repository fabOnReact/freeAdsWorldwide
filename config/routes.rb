Rails.application.routes.draw do
  resources :runs
	devise_for :users
	resources :companies, :companytypes, :campaigns
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'
	get "campaigns/:id/delete", to: 'campaigns#delete', as: 'delete_campaign'

	root :to => "landings#index"
  
end
