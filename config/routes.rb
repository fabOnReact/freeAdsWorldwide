Rails.application.routes.draw do
	devise_for :users
	resources :tests, :companies, :companytypes
	get "companies/:id", to: 'companies#delete'

=begin
	authenticated :user do
		root :to => "companies#index"
	end
=end

	root :to => "landings#index"
  
end
