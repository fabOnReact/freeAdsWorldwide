class Campaigntype < ApplicationRecord
	#has_many :promotions

	validates_presence_of :name
end
