require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Band do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Band.create!(@valid_attributes)
  end
end
