class Company < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :campaigns, :dependent => :destroy
	has_many :ads, :dependent => :destroy
	belongs_to :companytype

	validates_presence_of :name
	#validates_associated :users
	#validates_presence_of :users

	accepts_nested_attributes_for :campaigns

end
