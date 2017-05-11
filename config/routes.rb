Rails.application.routes.draw do
  	devise_for :users
	resources :companies, :companytypes, :ads # :campaigns, :runs

	resources :campaigns do 
		resources :runs
	end

	resources :qr_codes, only: [:new, :create]
	
	# companies 
	get "companies/:id/delete", to: 'companies#delete', as: 'delete_company'
	get "campaigns/:id/delete", to: 'campaigns#delete', as: 'delete_campaign'
	
	# runs
	get "runs/:id/delete", to: 'runs#delete', as: 'delete_run'
	
	# landing page
	post "landings", to: 'landings#createSubscription'
	
	root :to => "landings#index"  
end
