require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/sounds/index.html.erb" do
  include SoundsHelper
  
  before(:each) do
    assigns[:sounds] = [
      stub_model(Sound,
        :configuration => Configuration.make,
        :example_type => "value for example_type",
        :user => User.make
      ),
      stub_model(Sound,
        :configuration => Configuration.make,
        :example_type => "value for example_type",
        :user => User.make
      )
    ]
  end

  it "should render list of sounds" do
    render "/sounds/index.html.erb"
    response.should have_tag("tr>td", 'nasty', 2)
    response.should have_tag("tr>td", "value for example_type", 2)
    response.should have_tag("tr>td", 'billy', 2)
  end
end

