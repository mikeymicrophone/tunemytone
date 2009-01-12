require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/show.html.erb" do
  include ConfigurationsHelper
  
  before(:each) do
    assigns[:configuration] = @configuration = stub_model(Configuration,
      :name => "value for name",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/configurations/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
  end
end

