class Company < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :campaigns, :dependent => :destroy
	has_many :ads, :dependent => :destroy
	belongs_to :companytype

	validates_presence_of :name, :companytype, :description, :url
	#validates_associated :users
	#validates_presence_of :users
	validates :name, length: {minimim: 2, maximum: 24}
	validates :description, length: {minimum: 200, maximum: 360}


	def self.url(company)
		url = company.url
		
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
end
