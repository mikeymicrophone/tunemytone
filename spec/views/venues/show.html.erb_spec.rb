require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/venues/show.html.erb" do
  include VenuesHelper
  
  before(:each) do
    assigns[:venue] = @venue = stub_model(Venue,
      :name => "value for name",
      :address => "value for address",
      :line2 => "value for line2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :country => "value for country"
    )
  end

  it "should render attributes in <p>" do
    render "/venues/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ line2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ country/)
  end
end

