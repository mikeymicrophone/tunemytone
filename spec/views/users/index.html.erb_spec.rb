require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  include UsersHelper
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :login => "value for login",
        :email => "value for email"
      ),
      stub_model(User,
        :login => "value for login",
        :email => "value for email"
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "value for login", 2)
    response.should have_tag("tr>td", "value for email", 2)
  end
end

