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

	def self.address(ad)
		url = ad.company.url
		
		if url.start_with?("http://")
			address = url.gsub("http://", "")
		elsif url.start_with?("https://")
			address = url.gsub("https://", "")			
		elsif url.start_with?("https://www.")
			address = url.gsub("https://www.", "")					
		elsif url.start_with?("www.")
			address = url.gsub("www.", "")	
		else address = url				
		end

		address << "/" unless address.end_with?("/")
		return address = address + "ads/" + ad.id.to_s	
	end
end
