require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/knobs/edit.html.erb" do
  include KnobsHelper
  
  before(:each) do
    assigns[:knob] = @knob = stub_model(Knob,
      :new_record? => false,
      :host_type => "value for host_type",
      :name => "value for name",
      :discrete => "1",
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/knobs/edit.html.erb"
    
    response.should have_tag("form[action=#{knob_path(@knob)}][method=post]") do
      with_tag('input#knob_host_type[name=?]', "knob[host_type]")
      with_tag('input#knob_name[name=?]', "knob[name]")
      with_tag('input#knob_discrete[name=?]', "knob[discrete]")
      with_tag('input#knob_user[name=?]', "knob[user]")
    end
  end
end


