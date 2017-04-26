class Campaign < ApplicationRecord
	has_many :runs
	has_many :promotions
	belongs_to :campaigntype
	belongs_to :company

	validates_presence_of :name
	validates_uniqueness_of :company_id, scope: [:campaigntype_id], :message => "you can create only one type of Campaign for each company"
end
