class Company < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :campaigns, :dependent => :destroy
	has_many :ads, :dependent => :destroy
	belongs_to :companytype

	validates_presence_of :name, :companytype, :title, :description, :url
	#validates_associated :users
	#validates_presence_of :users
	validates :name, length: {minimim: 2, maximum: 24}
	validates :description, length: {minimum: 15, maximum: 295}
	#accepts_nested_attributes_for :campaigns

	def self.address(company, ad)
		url = company.url
		
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
