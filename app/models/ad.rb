class Ad < ApplicationRecord
	belongs_to :company
	belongs_to :run

	def self.visits(ad)
		ad.visits += 1
		ad.save
	end


	def self.website(ad)
		website = ad.company.website
		
		if website.start_with?("http://")
			return website
		elsif website.start_with?("https://")
			return website
		elsif website.start_with?("https://www.")
			return website
		elsif website.start_with?("www.")
			return website
		else 
			return website = "www." + website
		end
	end  
end
