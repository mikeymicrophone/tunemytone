require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/connections/index.html.erb" do
  include ConnectionsHelper
  
  before(:each) do
    assigns[:connections] = [
      stub_model(Connection,
        :output => ,
        :input => ,
        :user => 
      ),
      stub_model(Connection,
        :output => ,
        :input => ,
        :user => 
      )
    ]
  end

  it "should render list of connections" do
    render "/connections/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
  end
end

