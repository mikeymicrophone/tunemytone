require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inputs/edit.html.erb" do
  include InputsHelper
  
  before(:each) do
    assigns[:input] = @input = stub_model(Input,
      :new_record? => false,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/inputs/edit.html.erb"
    
    response.should have_tag("form[action=#{input_path(@input)}][method=post]") do
      with_tag('input#input_host_type[name=?]', "input[host_type]")
      with_tag('input#input_description[name=?]', "input[description]")
      with_tag('input#input_user[name=?]', "input[user]")
    end
  end
end


