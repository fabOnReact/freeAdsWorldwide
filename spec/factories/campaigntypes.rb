FactoryGirl.define do
  factory :campaigntype do
    name "Paper Campaign"

    factory :campaigntype_with_promotions do

      transient do 
        promotions_count 5
      end
      # campaign is not found
      after(:create) do |campaigntype, evaluator|
        create_list(:promotion, evaluator.promotions_count, campaigntype: campaigntype )
      end
    end
  end

  factory :invalidcampaigntype, :parent => :campaigntype do |f|
    name nil
  end
end
