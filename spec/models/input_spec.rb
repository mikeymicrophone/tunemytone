require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Input do
  before(:each) do
    @valid_attributes = {
      :host_type => "value for host_type",
      :host_id => "1",
      :description => "value for description",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Input.create!(@valid_attributes)
  end
end
