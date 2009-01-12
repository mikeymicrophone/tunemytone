require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/settings/index.html.erb" do
  include SettingsHelper
  
  before(:each) do
    assigns[:settings] = [
      stub_model(Setting,
        :knob => ,
        :user => ,
        :value => "1"
      ),
      stub_model(Setting,
        :knob => ,
        :user => ,
        :value => "1"
      )
    ]
  end

  it "should render list of settings" do
    render "/settings/index.html.erb"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

