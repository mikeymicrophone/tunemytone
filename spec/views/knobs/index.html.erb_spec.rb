require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/knobs/index.html.erb" do
  include KnobsHelper
  
  before(:each) do
    assigns[:knobs] = [
      stub_model(Knob,
        :host_type => "value for host_type",
        :name => "value for name",
        :discrete => "1",
        :user => User.make
      ),
      stub_model(Knob,
        :host_type => "value for host_type",
        :name => "value for name",
        :discrete => "1",
        :user => User.make
      )
    ]
  end

  it "should render list of knobs" do
    render "/knobs/index.html.erb"
    response.should have_tag("tr>td", "value for host_type", 2)
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

