require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/configurations/index.html.erb" do
  include ConfigurationsHelper
  
  before(:each) do
    assigns[:configurations] = [
      stub_model(Configuration,
        :name => "value for name",
        :user => User.make
      ),
      stub_model(Configuration,
        :name => "value for name",
        :user => User.make
      )
    ]
  end

  it "should render list of configurations" do
    render "/configurations/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

