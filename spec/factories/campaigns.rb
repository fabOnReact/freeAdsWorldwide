FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    targetcountries { Faker::Address.country }
    campaigntype 
    company
  

    factory :campaign_with_promotions do

      transient do 
        promotions_count 5
      end
      # campaign is not found
      after(:create) do |campaign, evaluator|
        create_list(:promotion, evaluator.promotions_count, campaign: campaign )
      end
    end

  end

  factory :invalidcampaign, :parent => :campaign do |f|
    f.name nil
    campaigntype nil
  end
  
end
