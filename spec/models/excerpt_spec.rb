require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Excerpt do
  before(:each) do
    @valid_attributes = {
      :context_type => "value for context_type",
      :context_id => "1",
      :description => "value for description",
      :user => nil
    }
  end

  it "should create a new instance given valid attributes" do
    Excerpt.create!(@valid_attributes)
  end
end
