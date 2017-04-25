class Campaign < ApplicationRecord
	has_many :runs
	belongs_to :campaigntype
	
	validates_presence_of :name
end
