class Campaign < ApplicationRecord
	has_many :runs, :dependent => :destroy
	belongs_to :campaigntype
	belongs_to :company

	validates_presence_of :name, :company_id, :campaigntype_id
	#validates_uniqueness_of :company_id, scope: [:campaigntype_id], :message => "you can create only one type of Campaign for each company"


	def self.visits(ad)
		campaign = ad.run.campaign
		# check if the Ad is selfpromotion
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
