require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Venue do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => "value for address",
      :line2 => "value for line2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :country => "value for country",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Venue.create!(@valid_attributes)
  end
end
