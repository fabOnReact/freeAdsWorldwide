# spec/factories/users.rb

FactoryGirl.define do 
	factory :user do |t|
		t.email { Faker::Internet.email }
		t.password { Faker::Internet.password(10, 20) }

		factory :user_with_companies do
			transient do
				companies_count 5
			end

			after(:create) do |user, evaluator|
				create_list(:company, evaluator.companies_count, users: [user])
			end
		end
	end
end