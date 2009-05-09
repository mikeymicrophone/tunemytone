require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/connections/edit.html.erb" do
  include ConnectionsHelper
  
  before(:each) do
    assigns[:connection] = @connection = stub_model(Connection,
      :new_record? => false,
      :output => Output.make,
      :input => Input.make,
      :user => User.make
    )
  end

  it "should render edit form" do
    render "/connections/edit.html.erb"
    
    response.should have_tag("form[action=#{connection_path(@connection)}][method=post]") do
      with_tag('input#connection_output[name=?]', "connection[output]")
      with_tag('input#connection_input[name=?]', "connection[input]")
      with_tag('input#connection_user[name=?]', "connection[user]")
    end
  end
end


