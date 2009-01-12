require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Show do
  before(:each) do
    @valid_attributes = {
      :venue => Venue.create,
      :performer_type => "value for performer_type",
      :performer_id => "1",
      :performed_at => Time.now, 
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Show.create!(@valid_attributes)
  end
end
