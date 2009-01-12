require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Knob do
  before(:each) do
    @valid_attributes = {
      :host_type => "value for host_type",
      :host_id => "1",
      :name => "value for name",
      :discrete => "1",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Knob.create!(@valid_attributes)
  end
end
