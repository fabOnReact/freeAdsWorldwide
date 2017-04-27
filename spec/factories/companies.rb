# spec/factories/companies.rb

FactoryGirl.define do
	factory :company do |f|
		f.name { Faker::Company.name }
		f.title nil
		f.description nil
		companytype
	
		factory :company_with_users do

			transient do 
				users_count 5
			end

			after(:create) do |company, evaluator|
				create_list(:user, evaluator.users_count, companies: [company])
			end
		end

	end

	factory :invalidcompany, :parent => :company do |f|
		f.name nil
	end

end