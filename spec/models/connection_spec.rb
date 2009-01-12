require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Connection do
  before(:each) do
    @valid_attributes = {
      :output => Output.create,
      :input => Input.create,
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Connection.create!(@valid_attributes)
  end
end
