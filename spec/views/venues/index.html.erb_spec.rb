require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/index.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venues] = [
      stub_model(Venue,
        :name => "value for name",
        :address => "value for address",
        :line2 => "value for line2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip",
        :country => "value for country"
      ),
      stub_model(Venue,
        :name => "value for name",
        :address => "value for address",
        :line2 => "value for line2",
        :city => "value for city",
        :state => "value for state",
        :zip => "value for zip",
        :country => "value for country"
      )
    ]
  end

  it "should render list of venues" do
    render "/venues/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for address", 2)
    response.should have_tag("tr>td", "value for line2", 2)
    response.should have_tag("tr>td", "value for city", 2)
    response.should have_tag("tr>td", "value for state", 2)
    response.should have_tag("tr>td", "value for zip", 2)
    response.should have_tag("tr>td", "value for country", 2)
  end
end

