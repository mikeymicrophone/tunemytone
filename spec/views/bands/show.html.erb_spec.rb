require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bands/show.html.erb" do
  include BandsHelper
  
  before(:each) do
    assigns[:band] = @band = stub_model(Band,
      :name => "value for name",
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/bands/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end

