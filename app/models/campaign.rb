class Campaign < ApplicationRecord
	has_many :runs
	#belongs_to :campaigntype
	validations
end
