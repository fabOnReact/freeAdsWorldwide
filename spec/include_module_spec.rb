require_relative 'helpers/helpers.rb'

RSpec.configure do |c|
	c.include Helpers
end

RSpec.describe "an example group" do
	it "has access to the helper methods defined in the module" do
		expect(help).to be(:available)
	end
end