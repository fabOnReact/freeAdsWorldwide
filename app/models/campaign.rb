class Campaign < ApplicationRecord
	has_many :runs
	has_many :promotions
	belongs_to :campaigntype
	belongs_to :company

	validates_presence_of :name
end
