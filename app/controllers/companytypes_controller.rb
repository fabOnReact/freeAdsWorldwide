class CompanytypesController < ApplicationController

	def index
		@companytypes = Companytype.all
	end

	def new
		@companytype = Companytype.new
	end

	def create
		@companytype = Companytype.new(input_params)
		if @companytype.save
			redirect_to action: "show", id: @companytype.id
		else
			render "new"
		end
	end

	def update
		@companytype = Companytype.find(params[:id])
		if @companytype.update_attributes(input_params)
			redirect_to action: "show", id: @companytype.id
		else
			render "edit"
		end
	end

	def show
		@companytype = Companytype.find(params[:id])
	end

	def destroy
		@companytype = Companytype.find(params[:id])
		if @companytype.destroy
			redirect_to action: "index"
		end
	end

	private

	def input_params
		params.require(:companytype).permit(:name)
	end
end
