class Company < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :campaigns
	belongs_to :companytype

	accepts_nested_attributes_for :campaigns


	validates_presence_of :name
	#validates_associated :users
	#validates_presence_of :users
end
