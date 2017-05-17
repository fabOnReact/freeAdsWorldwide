# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


companytype = Companytype.create(:name => "startup")
campaigntype = Campaigntype.create(:name => "Paper Advertisement")

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "fabrizio.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "StartupAds", :title => "Free Advertisement Worldwide distribution", :description => "Free Advertisement Worldwide distribution", :url => "growstartups.xyz", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :targetcountries => "Italy", :campaigntype_id => campaigntype.id, :company_id => company.id)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

company = Company.create(:name => "BateringApps", :title => "Free Apps in exchange of accomodation", :description => "Free Apps in exchange of accomodation", :url => "https://barteringapps.herokuapp.com/", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "My test campaign", :campaigntype_id => campaigntype.id, :company_id => company.id, :worldwide => true)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 30, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 70, :ownads => 30,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save


# Ending creating a User - Company - Campaign - Run


# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "ezio.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "Random Name 1", :title => "Free Advertisement Worldwide distribution", :description => "Random Name 1Random Name 1Random Name 1Random Name 1", :url => "https://www.similarweb.com/", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :targetcountries => "Italy", :campaigntype_id => campaigntype.id, :company_id => company.id)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

company = Company.create(:name => "Random Name 2", :title => "Free Apps in exchange of accomodation", :description => "Random Name 2Random Name 2Random Name 2Random Name 2Random Name 2", :url => "www.lastampa.it", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "My test campaign", :campaigntype_id => campaigntype.id, :company_id => company.id, :worldwide => true)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 30, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 70, :ownads => 30,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

# Ending creating a User - Company - Campaign - Run

# Starting creating a User - Company - Campaign - Run

user = User.create(:email => "filippo.bertoglio@gmail.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :city => "Torino",:password => "fabrizioowner", :password_confirmation => "fabrizioowner")

companytype = Companytype.first
user = User.last
campaigntype = Campaigntype.last


company = Company.create(:name => "Random Name 3", :title => "Free Advertisement Worldwide distribution", :description => "Random Name 3Random Name 3Random Name 3Random Name 3Random Name 3", :url => "http://www.ilsole24ore.com/", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "Paper Advertisement Campaign", :targetcountries => "Italy", :campaigntype_id => campaigntype.id, :company_id => company.id)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 50, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

company = Company.create(:name => "Random Name 4", :title => "Free Apps in exchange of accomodation", :description => "Random Name4Random Name4Random Name4Random Name4Random Name4", :url => "http://sometests.com/", :companytype_id => companytype.id)
user.companies << company
campaign = Campaign.create(:name => "My test campaign", :campaigntype_id => campaigntype.id, :company_id => company.id, :worldwide => true)

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 30, :ownads => 10,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

run = Run.create(:campaign_id => campaign.id, :runprintnumber => 70, :ownads => 30,:city => "Turin", :location => "around the city testing the app", :status => "to print")
Run.createAds(run)
run.status = "completed"
run.save

# Ending creating a User - Company - Campaign - Run