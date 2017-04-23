class LandingsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	layout 'landing'

	def index
		
        redirect_to companies_path if user_signed_in?
	end
	
end
