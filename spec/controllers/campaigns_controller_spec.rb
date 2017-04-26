require 'rails_helper'
require 'include_module_spec'

RSpec.describe CampaignsController, type: :controller do
	login_user

	describe "GET #index" do 

		it "assigns all campaigns to the @campaigns variable" do
			campaigns = Campaign.all
			get :index
			expect(assigns[:campaigns]).to eq(campaigns)
		end

		it "renders an index template" do
			get :index
			expect(response).to render_template "index"
		end

		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

	end

	describe "GET #new" do

		it "assigns a new campaign to the @campaign variable" do
			campaign = Campaign.new
			get :new
			expect(campaign).to eq(campaign)
		end

		it "should render the new template" do
			get :new
			expect(response).to render_template "new"
		end

		it "has a 200 status code" do
			get :new
			expect(response.status).to eq(200)
		end

	end

	describe "POST #create" do

		before(:each) do 
			@campaign = FactoryGirl.build(:campaign)
		end

		describe "responde to" do
			it "responds to html by default" do
				post :create, params: { campaign: build_attributes(:campaign) }
				expect(response.content_type).to eq "text/html"
			end
		end

		describe "a campaign object" do
			it "should have a campaigntype" do
				campaign = Campaign.new
				expect(campaign).to_not be_valid
			end

			it "creates a new campaign" do
				expect{ 
					post :create, params: { campaign: build_attributes(:campaign) }
				}.to change(Campaign, :count).by(1)
			end 

			it "saves the campaign and add a promotion" do
				expect { 
					post :create, params: { campaign: build_attributes(:campaign) }
					}.to change(Promotion, :count).by(1)
			end					

		end

	end

	it "will create an entry in the promotions table"
	it "will trigger an error if an entry in the promotions table already exist"
	it "should delete the corresponding entry in the promotions table"
end
