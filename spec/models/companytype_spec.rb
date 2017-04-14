require 'rails_helper'

RSpec.describe Companytype, type: :model do
  
  subject { Companytype.new }

  it "should be an instance of Companytype" do
  	expect(subject).to be_an_instance_of(Companytype)
  end

  it "should be have the name set as startup" do
  	subject.name = "startup"
  	expect(subject.name).to eql("startup")
  end

  it "should save" do
  	subject.name = "startup"
  	subject.save
  	expect(Companytype.count).to be(1)
  end

  it { should have_many(:companies)}  

  after(:all) {Companytype.destroy_all}
end
