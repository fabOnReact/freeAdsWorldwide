require 'rails_helper'
#require 'include_module_spec'

RSpec.describe "routing to profiles", :type => :routing do
#	login_user

	it "routes to the homepage" do
		expect(:get => "/").to route_to(
		:controller => "landing",
		:action => "index"
		)
	end

	it "logged user are routed to the user page"

end