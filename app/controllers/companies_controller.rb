class CompaniesController < ApplicationController
	def index
		@companies = current_user.companies
	end

	def new
		flash[:notice] = "Now you can register your company and configure your first Campaign" if current_user.companies.empty?
		@company = Company.new
		@campaign = Campaign.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save && current_user.companies << @company
			if params.has_key?(:campaign) && campaign_params.present? 
				campaign = Campaign.new(campaign_params)
				campaign.company_id = @company.id 
				campaign.save
			end
			flash[:notice] = "Your Company was saved"
			redirect_to action: "index"
			#binding.pry
		else
			#binding.pry
			flash[:error] = "An error occurred, the company was not saved"
			render "new"
		end
	end

	def edit 
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(company_params)
			flash[:notice] = "Your Company was saved"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the company was not saved"
			render "edit"
		end
	end

	def show
		@company = Company.find(params[:id])
	end

	def delete
		@company = Company.find(params[:id])
	end

	def destroy
		@company = Company.find(params[:id])
		if @company.destroy
			flash[:notice] = "The Company was destroyed"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the company was not saved"
			redirect_to action: "index"
		end
	end

	private

	def company_params 
		params.require(:company).permit(:companytype_id, :name, :title, :description, :website) 
	end
	def campaign_params		
		params.require(:campaign).permit(:name, :targetcountries, :campaigntype_id, :company_id) 
	end
end
