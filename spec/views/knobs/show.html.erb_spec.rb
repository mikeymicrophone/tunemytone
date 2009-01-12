require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/knobs/show.html.erb" do
  include KnobsHelper
  
  before(:each) do
    assigns[:knob] = @knob = stub_model(Knob,
      :host_type => "value for host_type",
      :name => "value for name",
      :discrete => "1",
      :user => 
    )
  end

  it "should render attributes in <p>" do
    render "/knobs/show.html.erb"
    response.should have_text(/value\ for\ host_type/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(//)
  end
end

