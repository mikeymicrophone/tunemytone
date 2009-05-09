require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/outputs/index.html.erb" do
  include OutputsHelper
  
  before(:each) do
    assigns[:outputs] = [
      stub_model(Output,
        :host_type => "value for host_type",
        :description => "value for description",
        :user => User.make
      ),
      stub_model(Output,
        :host_type => "value for host_type",
        :description => "value for description",
        :user => User.make
      )
    ]
  end

  it "should render list of outputs" do
    render "/outputs/index.html.erb"
    response.should have_tag("tr>td", "value for host_type", 2)
    response.should have_tag("tr>td", "value for description", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

