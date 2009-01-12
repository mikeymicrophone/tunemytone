require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Element do
  before(:each) do
    @valid_attributes = {
      :specification_type => "value for specification_type",
      :specification_id => "1",
      :configuration => Configuration.create,
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Element.create!(@valid_attributes)
  end
end
