require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inputs/show.html.erb" do
  include InputsHelper
  
  before(:each) do
    assigns[:input] = @input = stub_model(Input,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/inputs/show.html.erb"
    response.should have_text(/value\ for\ host_type/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(//)
  end
end

