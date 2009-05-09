require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/connections/show.html.erb" do
  include ConnectionsHelper
  
  before(:each) do
    assigns[:connection] = @connection = stub_model(Connection,
      :output => Output.make,
      :input => Input.make,
      :user => User.make
    )
  end

  it "should render attributes in <p>" do
    render "/connections/show.html.erb"
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(//)
  end
end

