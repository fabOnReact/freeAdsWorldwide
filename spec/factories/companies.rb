# spec/factories/companies.rb

FactoryGirl.define do
	factory :company do |f|
		f.name { Faker::Company.name }
		f.title nil
		f.description nil
		companytype
	end

	factory :invalidcompany, :parent => :company do |f|
		f.name nil
	end
end