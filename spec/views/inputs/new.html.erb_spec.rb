require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inputs/new.html.erb" do
  include InputsHelper
  
  before(:each) do
    assigns[:input] = stub_model(Input,
      :new_record? => true,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => 
    )
  end

  it "should render new form" do
    render "/inputs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", inputs_path) do
      with_tag("input#input_host_type[name=?]", "input[host_type]")
      with_tag("input#input_description[name=?]", "input[description]")
      with_tag("input#input_user[name=?]", "input[user]")
    end
  end
end


