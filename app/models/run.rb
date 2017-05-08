class Run < ApplicationRecord
	belongs_to :campaign
	has_many :ads
	
	validates_presence_of :runprintnumber, :ownads, :campaign_id
end
