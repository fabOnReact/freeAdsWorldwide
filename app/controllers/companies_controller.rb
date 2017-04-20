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
			flash[:notice] = "Your Company was saved"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the company was not saved"
			render "new"
		end
	end

	def edit 
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(input_params)
			flash[:notice] = "Your Company was saved"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the company was not saved"
			render "edit"
		end
	end

	def delete
		@company = Company.find(params[:id])
	end

	def destroy
		@company = Company.find(params[:id])
		if @company.destroy
			flash[:notice] = "The Company was destroied"
			redirect_to action: "index"
		else
			flash[:error] = "An error occurred, the company was not saved"
			redirect_to action: "index"
		end
	end

	private

	def input_params 
		params.require(:company).permit( :companytype_id, :name, :title, :description, :website)
	end
end