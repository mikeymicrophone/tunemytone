require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/outputs/new.html.erb" do
  include OutputsHelper
  
  before(:each) do
    assigns[:output] = stub_model(Output,
      :new_record? => true,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => User.make
    )
  end

  it "should render new form" do
    render "/outputs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", outputs_path) do
      with_tag("input#output_host_type[name=?]", "output[host_type]")
      with_tag("input#output_description[name=?]", "output[description]")
      with_tag("input#output_user[name=?]", "output[user]")
    end
  end
end


