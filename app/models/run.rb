class Run < ApplicationRecord
	require 'prawn'

	belongs_to :campaign
	has_many :ads, :dependent => :destroy
	

	validates_presence_of :runprintnumber, :ownads, :campaign_id, :city, :location
	validates :ownads, numericality: { greater_than_or_equal_to: 0, less_than: 75}
	validates :runprintnumber, numericality: { greater_than: 0, less_than: 80}
	#validates_with RunValidator, fields: [:current_user, :campaign_id, :status]

	def self.nextStatus(run)
		case run.status
		when "to distribute"
			return "completed"
		end
	end

  	def self.createAds(run)

	    campaign = run.campaign
	    company = campaign.company  		
	    # creating your own ads for that run
	    run.ownads.times do
	      Ad.create(:company_id => company.id, :run_id => run.id, :selfpromotion => true, :visits => 0)
	    end

	    # creating other people ads for that run
	    # 70% of ads (firstgroup) are given to those with the best ratio, while remainign
	    # to all the otherads

	    # calculating the number of ads
		if run.ownads < run.runprintnumber
		    otherads = run.runprintnumber - run.ownads
		    
		    # calculating first and second group
		    firstgroup = (otherads*0.70).ceil
		    secondgroup = otherads - firstgroup 
		    #binding.pry

		    # I filter out the company of the owner and filter by campaign type
		    campaigns = Campaign.where.not(:company_id => company.id).rewhere(:campaigntype_id => campaign.campaigntype_id).order(:created_at)
		    # I filter only campaigns that already have a run with status completed
		    campaigns = campaigns.joins(:runs).where('runs.status' => "completed")
		    # I calculated the visitsratio every time an Ad is visited at ads#show
		    # I order based on the visit ration, created at and also ads received
		    campaigns.order(visitratio: :desc, ads_received: :asc, created_at: :asc)   

		    # In case no campaigns are selected I go random
		    #campaigns = Campaign.all if campaigns.size == 0
			# I filter the first group from campaigns
		    numberofcompanies = (firstgroup/2).to_i
			#binding.pry		    	
			# If fewer companies as available ads are selected, I will change the number of ads printed	
		    if firstgroup > campaigns.size
		    	campaigns = Campaign.where(:campaigntype_id => run.campaign.campaigntype_id)
		    	ads = (firstgroup/campaigns.size).to_i
		    else
		    	campaigns = campaigns.limit(numberofcompanies)
		    	ads = 2
		    end

		    # Creating 2 Ads for each company in the firstgroup

		    campaigns.each do |c|
		      # Now I create 2 ads for everyone of those campaigns
		      ads.times do
		        Ad.create(:company_id => c.company.id, :run_id => run.id, :selfpromotion => false, :visits => 0)
		      end
		      # add field for taking count of this number of adds in the campaing.adsreceived
		      c.ads_received += 2
		      c.save
		    end

		    # remaining 1 Ad if firstgroup is an odd number
		    if firstgroup.odd? 
		      Ad.create(:company_id => campaigns[0].company.id, :run_id => run.id, :selfpromotion => false, :visits => 0)
		      campaigns[0].ads_received += 1
		      campaigns[0].save
		    end

		    #binding.pry
		    # Creating 1 Ad for each company in the secondgroup
		    campaigns = campaigns.order(:ads_received)
		    
			campaigns = campaigns.limit(secondgroup) if campaigns.size > secondgroup 
		    ads = (secondgroup / campaigns.size).to_i unless secondgroup == 0
		    unless secondgroup == 0
			    campaigns.each do |c|
			      ads.times do
			      	Ad.create(:company_id => c.company.id, :run_id => run.id, :selfpromotion => false, :visits => 0)
			      end
			      # add field for taking count of this number of adds in the campaing.adsreceived
			      c.ads_received += 1
			      c.save
			    end
			end
		end
 	end
end
