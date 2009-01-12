require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Album do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :performer_type => "value for performer_type",
      :performer_id => "1",
      :released_on => Date.today,
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Album.create!(@valid_attributes)
  end
end
