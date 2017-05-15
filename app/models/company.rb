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
end
