require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/shows/show.html.erb" do
  include ShowsHelper
  
  before(:each) do
    assigns[:show] = @show = stub_model(Show,
      :venue => Venue.make,
      :performer_type => "value for performer_type"
    )
  end

  it "should render attributes in <p>" do
    render "/shows/show.html.erb"
    response.should have_text(//)
    response.should have_text(/value\ for\ performer_type/)
  end
end

