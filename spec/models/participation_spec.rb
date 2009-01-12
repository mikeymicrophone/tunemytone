require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Participation do
  before(:each) do
    @valid_attributes = {
      :artist => Artist.create,
      :duration_type => "value for duration_type",
      :duration_id => "1",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Participation.create!(@valid_attributes)
  end
end
