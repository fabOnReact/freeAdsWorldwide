FactoryGirl.define do
  factory :run do
	campaign
	runprintnumber { Faker::Number.number(2) }
	ownads { Faker::Number.number(2) }
  end

  factory :invalidrun, :parent => :run do
  	campaign
  	runprintnumber nil
  	ownads nil
  end
end
