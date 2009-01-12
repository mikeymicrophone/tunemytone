require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Effect do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :brand => Brand.create,
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Effect.create!(@valid_attributes)
  end
end
