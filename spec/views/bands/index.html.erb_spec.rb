require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bands/index.html.erb" do
  include BandsHelper
  
  before(:each) do
    assigns[:bands] = [
      stub_model(Band,
        :name => "value for name",
        :user => 
      ),
      stub_model(Band,
        :name => "value for name",
        :user => 
      )
    ]
  end

  it "should render list of bands" do
    render "/bands/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", , 2)
  end
end

