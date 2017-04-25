class Company < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :promotions
  belongs_to :companytype

  validates_presence_of :name
end
