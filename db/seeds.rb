# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Companytype.create(:name => "startup")
companytype = Companytype.first
company = Company.create(:name => "StartupAds", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :website => "https://freeadsworldwide.herokuapp.com/", :companytype_id => companytype.id)
campaigntype = Campaigntype.create(:name => "Paper Advertisement")
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :targetcountries => "Italy", :campaigntype_id => campaigntype.id, :company_id => company.id)
