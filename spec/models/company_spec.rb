require 'rails_helper'

RSpec.describe Company, type: :model do

	subject { Company.new }

  it "should be an intance of Company" do
  	expect(subject).to be_an_instance_of(Company)
  end

  it "should have companytype_id set to 1" do
  	subject.companytype_id = 1
  	expect(subject.companytype_id).to be(1)
  end

  it "should save" do
  	subject.companytype_id = 1
  	subject.save
  	expect(Company.count).to eq 1
  end

end
