Rails.application.routes.draw do
  resources :ads
  resources :runs
	devise_for :users
	resources :companies, :companytypes, :campaigns
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'
	get "campaigns/:id/delete", to: 'campaigns#delete', as: 'delete_campaign'
	get "runs/:id/delete", to: 'runs#delete', as: 'delete_run'
	root :to => "landings#index"
  
end
