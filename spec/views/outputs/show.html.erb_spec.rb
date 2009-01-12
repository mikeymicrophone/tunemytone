require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/outputs/show.html.erb" do
  include OutputsHelper
  
  before(:each) do
    assigns[:output] = @output = stub_model(Output,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/outputs/show.html.erb"
    response.should have_text(/value\ for\ host_type/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(//)
  end
end

