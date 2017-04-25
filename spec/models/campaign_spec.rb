require 'rails_helper'

RSpec.describe Campaign, type: :model do
	let(:campaign) { campaign = FactoryGirl.create(:campaign) }
	let(:invalidcampaign) { invalidcampaign = FactoryGirl.build(:invalidcampaign) }
	let(:company) { company = FactoryGirl.create(:company)}
	let(:campaigntype) { campaigntype = FactoryGirl.create(:campaigntype)}
	let(:campaigntype_with_campaigns) { campaigntype_with_campaigns = FactoryGirl.create(:campaigntype_with_campaigns)}

	it "has a valid factory" do
		expect(campaign).to be_valid
		expect(campaigntype_with_campaigns).to be_valid
	end

	it "is invalid without a name, campaigntype and company" do
		expect(invalidcampaign).to_not be_valid
	end

	it "is invalid without a name" do
		newcampaign = FactoryGirl.build(:campaign, name: nil)
		expect(newcampaign).to_not be_valid
	end

	it "is invalid without a campaigntype" do
		newcampaign = FactoryGirl.build(:campaign, campaigntype: nil)
		expect(newcampaign).to_not be_valid
	end

	it "is invalid without a company" do
		newcampaign = FactoryGirl.build(:campaign, company: nil)
		expect(newcampaign).to_not be_valid
	end		

	it "returns the company name as a string" do
		campaign = FactoryGirl.create(:campaign, name: "FreeAdsWorldwide")
		expect(campaign.name).to be("FreeAdsWorldwide")
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

	it "should update the company name association" do 
		campaign.company = FactoryGirl.create(:company, name: "Advisory")
		expect(campaign.company.name).to be("Advisory")
		expect(company.campaigns).to include(campaign)
	end

	it "should correctly delete" do
		expect{ campaign.destroy }.to change(Campaign, :count).by(-1)
	end

	it "should have one company" do
		expect(campaign.company).to_not be_nil
	end

	it "should have one user through company"

	it "should have one campaigntype" do
		expect(campaign.campaigntype).to_not be_nil
	end

	it "should store correctly different countries" do
		newcampaign = FactoryGirl.create(:campaign, targetcountries: "IT")
		expect(campaign.targetcountries).to be("IT")
	end

	it "should store correctly different countries array"

	it { should belong_to(:company) }
	it { should belong_to(:campaigntype) }

end
