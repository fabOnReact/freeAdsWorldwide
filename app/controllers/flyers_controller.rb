class FlyersController < ApplicationController
  def index
  end

  def new
  	@flyer = Flyer.new
  end

  def create
  	@flyer.new(flyer_params)
  	if @flyer.save
  		redirect_to companies_path
  	else
		flash[:error] = "An error occurred, the Campaign was not saved"
  		render "new"
  	end
  end

  def edit
  end

  def delete
  end

  def flyer_params
  	params.require(:flyer).permit(:company_id, :language_id, :image)
  end
end
