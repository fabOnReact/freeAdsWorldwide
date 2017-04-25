require 'rails_helper'

RSpec.describe Campaign, type: :model do
	let(:campaign) { campaign = FactoryGirl.create(:campaign) }
	let(:invalidcampaign) { invalidcampaign = FactoryGirl.create(:invalidcampaign) }
	let(:company) { company = FactoryGirl.create(:company)}
	let(:campaigntype) { campaigntype = }

	it "has a valid factory" do
		expect(campaign).to be_valid
	end

	it "is invalid without a name, campaigntype and company" do
		expect(invalidcampaign).to_not be_valid
	end

	it "returns the company name as a string"
		campaign = FactoryGirl.create(:campaign, name: "FreeAdsWorldwide")
		expect(campaign.name)to be("FreeAdsWorldwide")
	end

	it "should be an instance of Campaign" do
		expect(campaign).to be_an_instance_of(:campaign)
	end

	it "should correctly save" do
		expect{ :campaign }.to change(Campaign, :count).by(1)
	end

	it "should correcly update" do
		campaign.update_attributes(:name => "FreeAds")
		expect(campaign.name).to be("FreeAds")
	end

	it "should update the associations" do 
		campaign.company = 

	it "should correctly delete"

	it "should have one company"

	it "should have one user through company"

	it "should have one campaigntype"

	it "test the associations"

	it "should store correctly different countries"

	it { should belong_to(:company) }
	it { should belong_to(:campaigntype) }

end
