require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sound do
  before(:each) do
    @valid_attributes = {
      :configuration => Configuration.create,
      :example_type => "value for example_type",
      :example_id => "1",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Sound.create!(@valid_attributes)
  end
end
