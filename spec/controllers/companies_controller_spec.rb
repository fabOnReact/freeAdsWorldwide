require 'rails_helper'
require 'include_module_spec'

RSpec.describe CompaniesController, type: :controller do

	describe "testing Helpers methods" do
		it "has access to the helper methods defined in the module" do
			expect(help).to be(:available)
		end		
	end

	describe "GET #index" do

		it "assigns all customers to @customers" do
			@companies = Company.all
			get :index
			expect(assigns['companies']).to eq(@companies)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

	end

	describe "GET #new" do 
		it "render the new template" do
			get :new
			expect(response).to render_template("new")
			expect(response.body).to eq ""
		end

		it "create a new company object" do
			get :new
			expect(assigns(:company)).to be_a_new(Company)
		end
	end

	describe "POST #create" do
		before(:each) do 
			@company = FactoryGirl.build(:companies)
		end

		describe "responde to" do
			it "responds to html by default" do
				post :create, params: { company: build_attributes(:companies) }
				expect(response.content_type).to eq "text/html"
			end
		end

		describe "a company object" do
			it "should have a companytype" do
				company = Company.new
				expect(company).to_not be_valid
			end

			it "creates a new company" do
				#company = Company.create(:companytype_id => @companytype.id)
				expect{ 
					post :create, params: { company: build_attributes(:companies) }
				}.to change(Company, :count).by(1)
			end 
		end
	end

	describe "GET #edit" 

	describe "PUT #update"

	describe "GET #delete"

	describe "DELETE #destroy"

end
