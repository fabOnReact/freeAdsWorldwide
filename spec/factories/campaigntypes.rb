FactoryGirl.define do
  factory :campaigntype do
    name "Paper Campaign"

  	factory :campaigntype_with_campaigns do

  		transient do 
  			campaigns_count 5
  		end
  		# campaign is not found
  		after(:create) do |campaigntype, evaluator|
  			create_list(:campaign, evaluator.campaigns_count, campaign: campaign )
  		end
  	end
  end
end
