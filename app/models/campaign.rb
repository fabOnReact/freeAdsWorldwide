class Campaign < ApplicationRecord
	has_many :runs, :dependent => :destroy
	belongs_to :campaigntype
	belongs_to :company

	validates_presence_of :name, :company_id, :campaigntype_id
	validates_uniqueness_of :company_id, scope: [:campaigntype_id], :message => "you can create only one type of Campaign for each company"
	
	def self.filtered(run)
	    campaigns = Campaign.where.not(:company_id => run.campaign.company.id).rewhere(:campaigntype_id => run.campaign.campaigntype_id)
	    return campaigns
	end	

	def self.visits(ad)
		campaign = ad.run.campaign
		if ad.selfpromotion  
			campaign.obtainedvisits += 1
		else
			campaign.givenvisits += 1
		end
		campaign.save
		campaign.reload
		campaign.visitratio = campaign.givenvisits / campaign.obtainedvisits 
		campaign.save
	end	
end