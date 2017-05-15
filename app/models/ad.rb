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
			return website = "https://" + website
		else 
			return website = "https://www." + website
		end
	end  

	def self.address(ad)
		website = ad.company.website
		
		if website.start_with?("http://")
			address = website.gsub("http://", "")
		elsif website.start_with?("https://")
			address = website.gsub("https://", "")			
		elsif website.start_with?("https://www.")
			address = website.gsub("https://www.", "")					
		elsif website.start_with?("www.")
			address = website.gsub("www.", "")	
		else address = website				
		end

		address << "/" unless address.end_with?("/")
		return address = address + "ads/" + ad.id.to_s	
	end
end
