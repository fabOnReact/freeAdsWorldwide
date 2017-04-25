FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    targetcountries { Faker::Address.country }
    association :campaigntype
    association :company
  end

  factory :invalidcampaign, :parent => :campaign do |f|
  	f.name nil
  	campaigntype nil
  	company nil
  end

end
