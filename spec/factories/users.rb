# spec/factories/users.rb

FactoryGirl.define do 
	factory :user do |t|
		t.email "fabrizu@email.com"
		t.password "fabrizio"

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