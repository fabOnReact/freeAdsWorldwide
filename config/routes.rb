Rails.application.routes.draw do
  	devise_for :users
	resources :companies, :companytypes, :campaigns, :ads, :runs
	resources :qr_codes, only: [:new, :create]
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'
	get "campaigns/:id/delete", to: 'campaigns#delete', as: 'delete_campaign'
	get "runs/:id/delete", to: 'runs#delete', as: 'delete_run'
	root :to => "landings#index"  
end
