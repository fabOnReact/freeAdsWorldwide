require 'rails_helper'

RSpec.describe Campaigntype, type: :model do
	it { should have_many(:campaigns) }
end
