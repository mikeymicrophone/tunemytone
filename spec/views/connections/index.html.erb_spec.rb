require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/connections/index.html.erb" do
  include ConnectionsHelper
  
  before(:each) do
    assigns[:connections] = [
      stub_model(Connection,
        :output => Output.make,
        :input => Input.make,
        :user => User.make
      ),
      stub_model(Connection,
        :output => Output.make,
        :input => Input.make,
        :user => User.make
      )
    ]
  end

  it "should render list of connections" do
    render "/connections/index.html.erb"
    response.should have_tag("tr>td", 'pizzle', 2)
    response.should have_tag("tr>td", 'pozzle', 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

