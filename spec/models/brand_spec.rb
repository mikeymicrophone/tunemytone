require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Brand do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :homepage => "value for homepage",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Brand.create!(@valid_attributes)
  end
end
