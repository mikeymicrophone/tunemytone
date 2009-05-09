require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/connections/new.html.erb" do
  include ConnectionsHelper
  
  before(:each) do
    assigns[:connection] = stub_model(Connection,
      :new_record? => true,
      :output => Output.make,
      :input => Input.make,
      :user => User.make
    )
  end

  it "should render new form" do
    render "/connections/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", connections_path) do
      with_tag("input#connection_output[name=?]", "connection[output]")
      with_tag("input#connection_input[name=?]", "connection[input]")
      with_tag("input#connection_user[name=?]", "connection[user]")
    end
  end
end


