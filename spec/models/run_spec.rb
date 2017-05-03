require 'rails_helper'

RSpec.describe Run, type: :model do
	subject { FactoryGirl.build(:run)}
	let(:run) { run = FactoryGirl.create(:run) }
	let(:invalidrun) { invalidrun = FactoryGirl.build(:invalidrun) }

	describe "validations" do

		it "has a valid factory" do
			expect(run).to be_valid
		end

		it "is invalid without a name, runtype" do
			expect(invalidrun).to_not be_valid
		end

		it "is invalid without a runprintnumber" do
			newrun = FactoryGirl.build(:run, runprintnumber: nil)
			expect(newrun).to_not be_valid
		end

		it "is invalid without ownads" do
			newrun = FactoryGirl.build(:run, ownads: nil)
			expect(newrun).to_not be_valid
		end

		it "is invalid without a campaign" do 
			newrun = FactoryGirl.build(:run, campaign: nil)
			expect(newrun).to_not be_valid
		end

	end

	describe "saving, updating and deleting" do

		it "returns the run name as a string" do
			run = FactoryGirl.create(:run, name: "FreeAdsWorldwide")
			expect(run.name).to eql("FreeAdsWorldwide")
		end

		it "should be an instance of Run" do
			expect(run).to be_an_instance_of(Run)
		end

		it "should correctly save" do
			expect{ run }.to change(Run, :count).by(1)
		end

		it "should correcly update" do
			run.update_attributes(:name => "FreeAds")
			expect(run.name).to eq("FreeAds")
		end

		it "should correctly delete" do
			run
			expect{ run.destroy! }.to change(Run, :count).by(-1)
		end

	end

	describe "associations" do

		it "should have one company" do
			expect(run.company).to_not be_nil
		end

		it "should have one user through company"

		it "should have one runtype" do
			expect(run.runtype).to_not be_nil
		end

		it "should store correctly different countries" do
			newrun = FactoryGirl.create(:run, targetcountries: "Italy")
			expect(newrun.targetcountries).to eq("Italy")
		end

		it "should store correctly different countries array"

	end

	it { should belong_to(:run) }

end
