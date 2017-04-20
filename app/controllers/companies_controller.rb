class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new(input_params)
		if @company.save
			redirect_to action: "index"
		else
			flash[:error] = "The Company was not saved"
			render "new"
		end
	end

	private

	def input_params 
		params.require(:company).permit( :companytype_id, :name, :title, :description, :website)
	end
end
