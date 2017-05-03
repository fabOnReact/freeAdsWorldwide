class Run < ApplicationRecord
	belongs_to :campaign

	validates_presence_of :runprintnumber, :ownads, :campaign_id
end
