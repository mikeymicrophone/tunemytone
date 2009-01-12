require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inputs/index.html.erb" do
  include InputsHelper
  
  before(:each) do
    assigns[:inputs] = [
      stub_model(Input,
        :host_type => "value for host_type",
        :description => "value for description",
        :user => 
      ),
      stub_model(Input,
        :host_type => "value for host_type",
        :description => "value for description",
        :user => 
      )
    ]
  end

  it "should render list of inputs" do
    render "/inputs/index.html.erb"
    response.should have_tag("tr>td", "value for host_type", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", , 2)
  end
end

