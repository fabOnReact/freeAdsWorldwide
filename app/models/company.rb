class Company < ApplicationRecord
  belongs_to :companytype
  has_and_belongs_to_many :users
end
