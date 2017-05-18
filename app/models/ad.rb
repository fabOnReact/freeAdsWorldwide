class Ad < ApplicationRecord
	belongs_to :company
	belongs_to :run

	def self.visits(ad)
		ad.visits += 1
		ad.save
	end


	def self.url(ad)
		url = ad.company.url
		
		if url.start_with?("http://")
			return url
		elsif url.start_with?("https://")
			return url
		elsif url.start_with?("https://www.")
			return url
		elsif url.start_with?("www.")
			return url = "https://" + url
		else 
			return url = "https://www." + url
		end
	end  

	def self.adUrl(ad)
		return url = "growstartups.xyz/ads/" + ad.id.to_s
	end	

	def self.postMultiple(campaigns, ads, run)
		unless ads == nil
		    campaigns.each do |c|
		      ads.times do
		      	Ad.create(:company_id => c.company.id, :run_id => run.id, :selfpromotion => false, :visits => 0)
		      end
		      # add field for taking count of this number of adds in the campaing.adsreceived
		      c.ads_received += ads
		      c.save
		    end	
		end
	end	
end
