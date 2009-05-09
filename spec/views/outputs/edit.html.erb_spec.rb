require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/outputs/edit.html.erb" do
  include OutputsHelper
  
  before(:each) do
    assigns[:output] = @output = stub_model(Output,
      :new_record? => false,
      :host_type => "value for host_type",
      :description => "value for description",
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/outputs/edit.html.erb"
    
    response.should have_tag("form[action=#{output_path(@output)}][method=post]") do
      with_tag('input#output_host_type[name=?]', "output[host_type]")
      with_tag('input#output_description[name=?]', "output[description]")
      with_tag('input#output_user[name=?]', "output[user]")
    end
  end
end


