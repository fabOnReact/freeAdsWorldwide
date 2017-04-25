require 'rails_helper'

RSpec.describe Campaign, type: :model do
	let(:campaign) { campaign = FactoryGirl.create(:campaign) }

	it "has a valid factory" do
		expect(campaign).to be_valid
	end

	it "is invalid without a name" do
		invalidcampaign = FactoryGirl.create(:invalidcampaign)
		expect(invalidcampaign).to_not be_valid
	end

	it "is invalid without a campaign type"

	it "is invalid without a company"

	it "returns the company name as a string"

	it "should be an instance of Campaign"

	it "should correctly save"

	it "should correcly upadate"

	it "should update the associations"

	it "should correctly delete"

	it "should have one company"

	it "should have one user through company"

	it "should have one campaigntype"

	it "test the associations"

	it "should store correctly different countries"

end
