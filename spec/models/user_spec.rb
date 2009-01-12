require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "billyhayho",
      :email => "beebs@gmizzle.com",
      :password => 'hellyno',
      :password_confirmation => 'hellyno'
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
