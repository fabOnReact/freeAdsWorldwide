class Promotion < ApplicationRecord
  belongs_to :campaigntype
  belongs_to :campaign
  belongs_to :company
  has_many :runs
  
  validates :campaigntype_id, uniqueness: { scope: [:campaign_id, :company_id], message: "You can only create one type of campaign for each company"}
  validates :campaign_id, uniqueness: { scope: [:campaigntype_id, :company_id], message: "You can only create one type of campaign for each company"}
  validates :company_id, uniqueness: { scope: [:campaign_id, :campaigntype_id], message: "You can only create one type of campaign for each company"}
end
