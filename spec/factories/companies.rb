# spec/factories/companies.rb

FactoryGirl.define do
	factory :companies, :class => Company do |f|
		association :companytype
		f.name "firstcompany"
		f.title nil
		f.description nil
	end
end