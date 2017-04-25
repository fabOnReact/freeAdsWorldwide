# spec/factories/companies.rb

FactoryGirl.define do
	factory :company do |f|
		association :companytype
		f.name { Faker::Company.name }
		f.title nil
		f.description nil
	end

	factory :invalidcompany, :parent => :company do |f|
		f.name nil
	end
end