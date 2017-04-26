class CampaignsController < ApplicationController

	def index
		@campaigns = Campaign.all
	end

	def new
		@campaign = Campaign.new
	end

	def create 
		@campaign = Campaign.new(input_params)
		if @campaign.save
			flash[:notice] = "Your Campaign was saved"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the Campaign was not saved"
			render "new"
		end		
	end

	private

	def input_params 
		params.require(:campaign).permit(:name, :targetcountries, :campaigntype_id, :company_id)
	end

end
