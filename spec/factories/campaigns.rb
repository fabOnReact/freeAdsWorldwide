FactoryGirl.define do
  factory :campaign do
    name { Faker::Company.name }
    targetcountries { Faker::Address.country }
    campaigntype
  end

  factory :invalidcampaign, :parent => :campaign do |f|
  	f.name nil
  end

end
