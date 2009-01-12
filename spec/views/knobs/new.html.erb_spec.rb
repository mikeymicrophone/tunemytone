require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/knobs/new.html.erb" do
  include KnobsHelper
  
  before(:each) do
    assigns[:knob] = stub_model(Knob,
      :new_record? => true,
      :host_type => "value for host_type",
      :name => "value for name",
      :discrete => "1",
      :user => 
    )
  end

  it "should render new form" do
    render "/knobs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", knobs_path) do
      with_tag("input#knob_host_type[name=?]", "knob[host_type]")
      with_tag("input#knob_name[name=?]", "knob[name]")
      with_tag("input#knob_discrete[name=?]", "knob[discrete]")
      with_tag("input#knob_user[name=?]", "knob[user]")
    end
  end
end


