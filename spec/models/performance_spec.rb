require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Performance do
  before(:each) do
    @valid_attributes = {
      :song => Song.create,
      :performed_at => Time.now,
      :show => Show.create,
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Performance.create!(@valid_attributes)
  end
end
